class TasksController < ApplicationController
  skip_before_action :authorized, only: [:show]

  def show
    task = Task.find_by(id: params[:id])

    if task.valid?
      render json: task
    else
      render json: { error: 'Task could not be found'}
    end
  end
end
