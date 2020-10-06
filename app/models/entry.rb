class Entry < ApplicationRecord
  belongs_to :task
  has_many :user_entries
  has_many :users, :through => :user_entries

  def update_progress_tree

    # udpate task progress
    task = self.task
    task.update_progress

    # update milestones progress
    milestone = task.milestone
    milestone.update_progress

    # update project progress
    project = milestone.project
    project.update_progress
  end
end
