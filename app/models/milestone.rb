class Milestone < ApplicationRecord
  belongs_to :project
  has_many :tasks

  def update_progress
    tasks_size = self.tasks.size

    tasks_progress_sum = self.tasks.inject(0) {|sum, task| sum + task[:progress]}
    updated_progress = tasks_progress_sum/tasks_size

    self.update(progress: updated_progress)
  end
end
