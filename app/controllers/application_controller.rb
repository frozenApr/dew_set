class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include JwtSessionAble
  
  # 发送messenger通知
  # 用法
  #   messenger alert: '出错了'
  #   messenger notice: '保存成功'
  #   messenger(errors: user) unless user.save()
  #   messenger(errors: user.errors) unless user.save()
  #   messenger(errors: ['帐号出错了', '密码出错了'])
  #
  # html请求
  #   redirect_back
  #   flash通知
  # ujs请求
  #   flash通知
  def messenger(alert: nil, notice: nil, errors: nil, data: {})
    # 转换errors
    unless errors.nil?
      if errors.is_a? ActiveRecord::Base
        errors = errors.errors.full_messages
      elsif errors.is_a? ActiveModel::Errors
        errors = errors.full_messages
      elsif errors.is_a?(String)
        errors = [errors]
      elsif errors.is_a?(Array) || errors.is_a?(Hash)
        errors = errors
      else
        logger.error("unknown errors type: #{errors.class}")
      end
    end
    respond_to do |format|
      format.html {
        if errors
          flash[:errors] = errors
        elsif alert
          flash[:alert] = alert
        elsif notice
          flash[:notice] = notice
        end
        redirect_back fallback_location: admin_root_path
      }
      format.js {
        if errors
          flash[:errors] = errors
        elsif alert
          flash[:alert] = alert
        elsif notice
          flash[:notice] = notice
        end
        render :partial => "common/messenger_script"
      }
    end
  end
end
