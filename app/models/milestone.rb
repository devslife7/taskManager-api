class Milestone < ApplicationRecord
  belongs_to :project
  has_many :tasks

  def update_progress
    tasks_size = self.tasks.size

    sum = self.tasks.inject(0) {|sum, task| sum + task[:progress]}
    amount = sum/tasks_size

    self.update(progress: amount)
  end
end
