class Api::V1::ExpertisesController < ApplicationController
  before_action :set_expertise, only: [:show]
    
  def show
    render json:
      @expertise ? @expertise : { error: "Expertise not found" },
      status: @expertise ? :ok : :not_found
  end

  private

  def set_expertise
    @expertise = Expertise.where(user_id: params[:user_id]).find_by(id: params[:id])
  end

  def expertise_params
    params.require(:expertise).permit(:domain, :years_of_experience)
  end  
end

