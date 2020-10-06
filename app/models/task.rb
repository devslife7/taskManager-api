class Task < ApplicationRecord
  belongs_to :milestone
  has_many :user_tasks
  has_many :users, :through => :user_tasks
  has_many :entries

  def update_progress
    last_entry_progress = self.entries.last.progress
    self.update(progress: last_entry_progress)
  end
end
