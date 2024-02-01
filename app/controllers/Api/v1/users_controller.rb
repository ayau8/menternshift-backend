class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  
  def index
    users = User.all
    render json: users
  end
  
  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :role, :first_name, :middle_name, :last_name, :username, :location, :company, :job_title, :bio, :guidances, :languages, :skills, :is_available, :timezone, :social_platforms, :profile_img)
  end  
end

