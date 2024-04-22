class Api::V1::ExpertisesController < ApplicationController
  before_action :set_expertise, only: [:show, :update, :destroy]

  def index
    @expertises = Expertise.where(user_id: params[:user_id])

    render json:
      @expertises.present? ? @expertises : { error: "Expertises not found" },
      status: @expertises.present? ? :ok : :not_found
  end

  def show
    render json:
      @expertise ? @expertise : { error: "Expertise not found" },
      status: @expertise ? :ok : :not_found
  end

  def new
    @expertise = Expertise.new
    render json: { expertise: @expertise }
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @expertise = Expertise.new(expertise_params)
    @expertise.user = @user
    if @expertise.save
      render json: { expertise: @expertise }, status: :created
    else
      render json: { errors: @expertise.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @expertise.update(expertise_params)
      render json: { expertise: @expertise }, status: :ok
    else
      render json: { errors: @expertise.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    render json:
      @expertise ? @expertise.destroy : { error: "Expertise not found" },
      status: @expertise ? :no_content : :not_found
  end

  private

  def set_expertise
    @expertise = Expertise.find_by(user_id: params[:user_id], id: params[:id])
  end

  def expertise_params
    params.require(:expertise).permit(:domain, :years_of_experience)
  end
end
