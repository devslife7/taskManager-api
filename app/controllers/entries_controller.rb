class EntriesController < ApplicationController
  skip_before_action :authorized, only: [:create, :destroy]

  def create
    entry = Entry.create(entry_params)

    entry.update_tree


    # byebug


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
    params.require(:entry).permit(:date, :progress, :notes, :task_id)
  end
end
