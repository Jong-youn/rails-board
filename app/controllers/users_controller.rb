class UsersController < ApplicationController

    before_action :configure_permitted_parameters, if: :devise_controller?

    def new
        @user = User.new
    end

    def create
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:account])
    end
end
