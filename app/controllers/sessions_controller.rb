class SessionsController < ApplicationController
  def create
    user = User.find_by(phone_number: params[:session][:phone_number])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to :root, notice: '登陆成功！'
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to :root
  end
end
