class Task < ApplicationRecord
  belongs_to :milestone
  has_many :user_tasks, :dependent => :destroy
  has_many :users, :through => :user_tasks
  has_many :entries, :dependent => :destroy

  def update_progress
    # fixed crash when last entry is deleted
    entries = self.entries
    last_entry_progress = entries.empty? ? 0 : entries.last.progress

    self.update(progress: last_entry_progress)
  end

  def update_progress_tree

    # update milestone progress
    milestone = self.milestone
    milestone.update_progress

    # update project progress
    project = milestone.project
    project.update_progress
    
  end

end
