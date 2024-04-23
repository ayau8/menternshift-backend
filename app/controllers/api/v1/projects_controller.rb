class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: %i[show update destroy]

  def index
    @projects = Project.where(user_id: params[:user_id])

    render json: @projects.present? ? @projects : { error: 'Projects not found' },
           status: @projects.present? ? :ok : :not_found
  end

  def show
    render json: @project || { error: 'Project not found' },
           status: @project ? :ok : :not_found
  end

  def new
    @project = Project.new
    render json: { project: @project }
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @project = Project.new(project_params)
    @project.user = @user
    if @project.save
      render json: { project: @project }, status: :created
    else
      render json: { errors: @project.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render json: { project: @project }, status: :ok
    else
      render json: { errors: @project.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @project ? @project.destroy : { error: 'Project not found' },
           status: @project ? :no_content : :not_found
  end

  private

  def set_project
    @project = Project.find_by(user_id: params[:user_id], id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :image_url, :start_date, :end_date, :duration, :progress, skills: [])
  end
end
