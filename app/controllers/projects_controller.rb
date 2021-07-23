class ProjectsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create, :update, :destroy]

  def index
    projects = Project.all

    render json: projects, only: [:id, :name, :progress, :end_date]
  end

  def show
    project = Project.find_by(id: params[:id])

    if project
      render json: project, include: [:milestones], except: [:created_at, :updated_at]
    else
      render json: { error: "Project could not be found"}
    end
  end

  def create
    project = Project.create(project_params)
    
    if project.valid?
      render json: { project: project }, include: [:milestones], except: [:created_at, :updated_at]
    else
      render json: { error: "Could not create a new Project"}, status: :unauthorized
    end
  end

  def update
    project = Project.find_by(id: params[:id])

    if project
      project.update(project_params)
      render json: { project: project }, include: [:milestones], except: [:created_at, :updated_at]
    else
      render json: { error: "Project could not be found" }
    end
  end

  def destroy
    project = Project.find_by(id: params[:id])

    if project
      project.destroy
      render json: { project: project.as_json( only: [:id]) }
    else
      render json: { error: "Project could not be found"}
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date)
  end
end
