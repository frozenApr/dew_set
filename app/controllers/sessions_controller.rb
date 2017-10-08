class SessionsController < ApplicationController
  def create
    user = User.find_by(phone_number: params[:user][:phone_number])
    if user && user.authenticate(params[:user][:password])
      login_by user
      redirect_to :root, notice: '登陆成功！'
    else
      render 'new'
    end
  end

  def logout
    super
    redirect_to :root
  end
end
