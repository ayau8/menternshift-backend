class Api::V1::ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[show update destroy]

  def index
    @experiences = Experience.where(user_id: params[:user_id])

    render json: @experiences.present? ? @experiences : { error: "experiences not found" },
           status: @experiences.present? ? :ok : :not_found
  end

  def show
    render json: @experience || { error: "experience not found" },
           status: @experience ? :ok : :not_found
  end

  def new
    @experience = Experience.new
    render json: { experience: @experience }
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @experience = Experience.new(experience_params)
    @experience.user = @user
    if @experience.save
      render json: { experience: @experience }, status: :created
    else
      render json: { errors: @experience.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @experience.update(experience_params)
      render json: { experience: @experience }, status: :ok
    else
      render json: { errors: @experience.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    render json:
      @experience ? @experience.destroy : { error: "experience not found" },
      status: @experience ? :no_content : :not_found
  end

  private

  def set_experience
    @experience = Experience.find_by(user_id: params[:user_id], id: params[:id])
  end

  def experience_params
    params.require(:experience).permit(:company, :job_title, :description, :start_date, :end_date)
  end
end
