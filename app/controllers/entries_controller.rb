class EntriesController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    entry = Entry.create(entry_params)
    if entry
      render json: entry
    else
      render json: { error: "Entry could not be created"}
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:date, :notes, :completion_percentage, :user_id, :task_id)
  end
end
