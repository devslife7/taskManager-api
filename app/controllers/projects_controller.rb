class ProjectsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    projects = Project.all

    render json: projects, include: [:tasks]
  end
end
