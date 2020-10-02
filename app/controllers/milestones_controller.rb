class MilestonesController < ApplicationController
  skip_before_action :authorized, only: [:show]

  def show
    milestone = Milestone.find_by(id: params[:id])

    if milestone
      render json: milestone
    else
      render json: { error: "Milestone could not be found"}
    end
  end
end
