class ProjectsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create, :destroy]

  def index
    projects = Project.all

    render json: projects, include: [:tasks]
  end

  def show
    project = Project.find_by(id: params[:id])

    if project.valid?
      render json: project, include: [:tasks]
    else
      render json: { error: "Project could not be found"}
    end
  end

  def create
    project = Project.create(project_params)
    
    if project.valid?
      render json: project
    else
      render json: { error: "Could not create a new Project"}
    end
  end

  def destroy
    project = Project.find_by(id: params[:id])

    if project
      project.destroy
      render json: { id: project.id}
    else
      render json: { error: "Project could not be found"}
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :deadline)
  end
end
