class RegistrationsController < Devise::RegistrationsController

  def create
    new_user = User.new(user_params)
  end

  private
    def user_params
      @user_params = params[:user].permit(:account, :nickname, :email, :password)
    end
end