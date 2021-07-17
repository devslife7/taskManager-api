class Task < ApplicationRecord
  belongs_to :milestone
  has_many :user_tasks
  has_many :users, :through => :user_tasks
  has_many :entries

  def update_progress
    if !self.entries.empty?
      last_entry_progress = self.entries.last.progress
    else 
      last_entry_progress = 0 # when entry array is empty the progress is set to 0
    end
    self.update(progress: last_entry_progress)
  end

  def update_progress_tree
    
    # udpate task progress
    self.update_progress

    # update milestone progress
    milestone = self.milestone
    milestone.update_progress

    # update project progress
    project = milestone.project
    project.update_progress
    
  end

end
