class MilestonesController < ApplicationController
  skip_before_action :authorized, only: [:show, :create, :update, :destroy]

  def show
    milestone = Milestone.find_by(id: params[:id])

    if milestone
      render json: milestone, include: [:tasks]
    else
      render json: { error: "Milestone could not be found"}
    end
  end

  def create
    milestone = Milestone.create(milestone_params)

    project = milestone.project
    project.update_progress

    if milestone.valid?
      render json: { 
        milestone: milestone.as_json( except: [:created_at, :updated_at] ),
        project: project.as_json( only: [:id, :progress])
      }
    else
      render json: { error: 'Milestone could not be created'}
    end
  end

  def update
    milestone = Milestone.find_by(id: params[:id])

    if milestone
      milestone.update(update_milestone_params)
      render json: { milestone: milestone }, except: [:created_at, :updated_at]
    else
      render json: { error: "Milestone could not be found"}
    end
  end

  private

  def milestone_params
    params.require(:milestone).permit(:name, :start_date, :end_date, :project_id)
  end

  def update_milestone_params
    params.require(:milestone). permit(:name, :start_date, :end_date)
  end

end
