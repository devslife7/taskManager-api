class ProjectsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

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
end
