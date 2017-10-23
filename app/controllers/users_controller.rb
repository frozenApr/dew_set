class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to :root, notice: '登陆成功！'
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :phone_number, :gender, :age, :place,
                                 :avatar, :password, :password_confirmation)
  end
end
