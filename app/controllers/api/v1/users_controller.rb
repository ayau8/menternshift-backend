class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all

    render json: @users.present? ? @users : { error: "Users not found" },
           status: @users.present? ? :ok : :not_found
  end

  def show
    render json: @user || { error: "User not found" },
           status: @user ? :ok : :not_found
  end

  def new
    @user = User.new
    render json: { user: @user }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { user: @user }, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: { user: @user }, status: :ok
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @user ? @user.destroy : { error: "User not found" },
           status: @user ? :no_content : :not_found
  end

  private

  def set_user
    @user = User.includes(:expertises).find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :role, :first_name, :middle_name, :last_name, :username, :location, :company, :job_title, :bio, :is_available, :timezone, :social_platforms, :profile_img, :password, guidances: [], languages: [], skills: [])
  end
end
