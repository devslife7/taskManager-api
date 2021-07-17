class TasksController < ApplicationController
  skip_before_action :authorized, only: [:show, :create, :destroy]

  def show
    task = Task.find_by(id: params[:id])

    if task.valid?
      render json: task, include: [:entries => { include: [:users] }]
    else
      render json: { error: 'Task could not be found'}
    end
  end

  def create
    task = Task.create(task_params)

    if task.valid?
      render json: task, except: [:created_at, :updated_at]
    else
      render json: { error: 'Task could not be created'}
    end
  end

  def destroy
    task = Task.find_by(id: params[:id])

    if task
      task.destroy
      render json: task.id
    else
      render json: { error: "Task could not be found"}
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :notes, :hours, :start_date, :end_date, :milestone_id, :progress)
  end

end 
