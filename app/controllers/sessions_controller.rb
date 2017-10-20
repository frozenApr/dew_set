class SessionsController < ApplicationController
  def create
    user = User.ransack(phone_number_or_nick_name_or_email_eq:
                        user_params[:phone_number_or_nick_name_or_email_eq]).result
    if user && user.authenticate(params[:user][:password])
      login_by user
      messenger notice: '登陆成功！'
    else
      messenger notice: '账号或密码错误！'
    end
  end

  def destroy
    logout
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:phone_number_or_nick_name_or_email_eq)
  end
end
