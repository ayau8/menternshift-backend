class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]
    
  def show
    render json: (@user ? @user : { error: "User not found" }), status: (@user ? :ok : :not_found)
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :role, :first_name, :middle_name, :last_name, :username, :location, :company, :job_title, :bio, :guidances, :languages, :skills, :is_available, :timezone, :social_platforms, :profile_img)
  end  
end

