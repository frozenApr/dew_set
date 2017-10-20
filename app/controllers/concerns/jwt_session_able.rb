module JwtSessionAble
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :current_user_id
  end

  protected

  def _get_token
    cookies.fetch(:access_token, nil)
  end

  def _set_token(id, expires = 1.hour.from_now)
    cookies[:access_token] = {
      value: JwtSession.encode({ id: id }, expires: expires),
      expires: expires
    }
  end

  def login_by(user, expires = 1.hour.from_now)
    _set_token(user.id, expires)
    # redirect_to(request.referer)
  end

  def logout
    cookies.delete(:access_token)
  end

  def current_user_id
    if defined?(@current_user_id).nil? || @current_user_id.nil?
      token = _get_token
      jwt_session = JwtSession.decode(token)
      if jwt_session.expire?
        @current_user_id = nil
      else
        @current_user_id = jwt_session.data[:id]
        _set_token(@current_user_id) if jwt_session.need_refresh?
      end
    end
    @current_user_id
  end

  def current_user
    # if defined?(@current_user).nil? || @current_user.nil?
    # id = current_user_id
    # if id
    #   @current_user = User.find_by(id: id)
    # else
    #   @current_user = nil
    # end
    # end
    @current_user = User.find_by(id: current_user_id) if defined?(@current_user).nil? || @current_user.nil?
    @current_user
  end

  class JwtSession
    require 'jwt'

    EXPIRE_TIME = 1.hour
    NEED_REFRESH_TIME = 30.minutes

    def initialize(payload)
      @payload = {
        expires: 0,
        data: nil
      }.merge(payload)
    end

    def remaining
      Time.at(@payload[:expires]).to_datetime.to_i - Time.now.to_i
    end

    def need_refresh?
      remaining < NEED_REFRESH_TIME.minutes
    end

    def expire?
      remaining < 0
    end

    def data
      Rails.logger.debug @payload.to_s
      @payload[:data]
    end

    def self.encode(data, options = {})
      options = { expires: EXPIRE_TIME.from_now }.merge(options)
      payload = {
        expires: options[:expires].to_i,
        data: data
      }
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def self.decode(token)
      payload = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      new(payload.deep_symbolize_keys)
    rescue
      new({})
    end
  end
end
