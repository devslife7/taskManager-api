class TasksController < ApplicationController
  skip_before_action :authorized, only: [:show, :create, :update, :destroy]

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
    task.update_progress_tree

    milestone = task.milestone
    project = milestone.project

    if task.valid?
      render json: {
        task: task.as_json( except: [:created_at, :updated_at]),
        milestone: milestone.as_json( only: [:id, :progress]),
        project: project.as_json( only: [:id, :progress])
      }
    else
      render json: { error: 'Task could not be created'}
    end
  end

  def update
    task = Task.find_by(id: params[:id])

    if task
      task.update(task_params)
      render json: { task: task }, except: [:created_at, :updated_at]
    else 
      render json: { error: "Task could not be found"}
    end
  end

  def destroy
    task = Task.find_by(id: params[:id])

    milestone = task.milestone
    project = milestone.project

    if task
      task.destroy

      task.update_progress_tree
      
      render json: {
        task: task.as_json( only: [:id]),
        milestone: milestone.as_json( only: [:id, :progress]),
        project: project.as_json( only: [:id, :progress])     
      }
    else
      render json: { error: "Task could not be found"}
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :notes, :hours, :start_date, :end_date, :milestone_id)
  end
end 
