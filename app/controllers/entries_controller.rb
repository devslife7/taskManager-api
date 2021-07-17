class EntriesController < ApplicationController
  skip_before_action :authorized, only: [:create, :update, :destroy]

  def create
    user = User.find_by(id: params[:user_id])
    entry = Entry.create(entry_params)
    entry.update_progress_tree

    task = entry.task
    milestone = task.milestone
    project = milestone.project

    if entry
      entry.users << user

      render json: {
        entry: entry.as_json( include: [:users]),
        task: task,
        milestone: milestone,
        project: project
      }, except: [:created_at, :updated_at]
    else
      render json: { error: "Entry could not be created"}
    end
  end

  def update
    entry = Entry.find_by(id: params[:id])

    task = entry.task
    milestone = task.milestone
    project = milestone.project

    if entry
      entry.update(update_entry_params)
      entry.update_progress_tree

      render json: {
        entry: entry.as_json( include: [:users]),
        task: task,
        milestone: milestone,
        project: project
      }, except: [:created_at, :updated_at, :name, :end_date, :hours, :project_id, :start_date, :description, :milestone_id]


    else
      render json: { error: "Entry could not be found"}
    end
  end

  def destroy
    entry = Entry.find_by(id: params[:id])

    task = entry.task
    milestone = task.milestone
    project = milestone.project

    if entry
      entry.destroy
      entry.update_progress_tree
      render json: {
        entry_id: entry.id,
        task: task,
        milestone: milestone,
        project: project
      }
    else
      render json: { error: "Entry could not be found"}
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:date, :progress, :notes, :task_id)
  end

  def update_entry_params
    params.require(:entry).permit(:date, :progress, :notes)
  end
end
