class EntriesController < ApplicationController
  skip_before_action :authorized, only: [:create, :destroy]

  def create
    task = Task.find_by(id: params[:entry][:task_id])
    entry = Entry.create(entry_params)
    
    sum = 0
    task.entries.each do |entry|
      sum = sum + entry.completion_percentage.to_i
    end
    # task.update({completion_percentage: `#{sum}%`})
    str = "#{sum}%"
    task.update({completion_percentage: str})


    project = task.project
    sum1 = 0
    project.tasks.each do |task|
      sum1 = sum1 + task.completion_percentage.to_i
    end
    avg = (sum1/project.tasks.length).ceil()

    byebug

    project.update({completion_percentage: "#{avg}%"})


    if entry
      render json: entry
    else
      render json: { error: "Entry could not be created"}
    end
  end

  def destroy
    entry = Entry.find_by(id: params[:id])
    
    if entry
      entry.destroy
      render json: entry.id
    else
      render json: { error: "Entry could not be found"}
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:date, :notes, :completion_percentage, :user_id, :task_id)
  end
end
