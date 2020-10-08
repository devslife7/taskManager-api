class EntriesController < ApplicationController
  skip_before_action :authorized, only: [:create, :update, :destroy]

  def create
    entry = Entry.create(entry_params)
    entry.update_progress_tree

    task = entry.task
    milestone = task.milestone
    project = milestone.project

    if entry
      render json: {
        entry: entry,
        task: task,
        milestone: milestone,
        project: project
      }
    else
      render json: { error: "Entry could not be created"}
    end
  end

  def update
    entry = Entry.find_by(id: params[:id])

    if entry
      entry.update(update_entry_params)

      render json: { entry: entry }
    else
      render json: { error: "Entry could not be found"}
    end
  end

  def destroy
    entry = Entry.find_by(id: params[:id])
    
    if entry
      entry.destroy
      render json: { entry_id: entry.id }
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
