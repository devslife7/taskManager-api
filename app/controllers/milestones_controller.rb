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

    if milestone.valid?
      render json: { milestone: milestone.as_json( except: [:created_at, :updated_at])}
    else
      render json: { error: 'Milestone could not be created'}
    end
  end

  private

  def milestone_params
    params.require(:milestone).permit(:name, :hours, :progress, :start_date, :end_date, :project_id)
  end

  def update_milestone_params

  end

end
