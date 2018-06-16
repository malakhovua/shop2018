class UsersController < ApplicationController
  def me
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to me_users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end

end
