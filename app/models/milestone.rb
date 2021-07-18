class Milestone < ApplicationRecord
  belongs_to :project
  has_many :tasks, :dependent => :destroy

  def update_progress
    task_array = self.tasks
    tasks_size = task_array.size === 0 ? 1 : task_array.size

    tasks_progress_sum = task_array.inject(0) {|sum, task| sum + task[:progress]}
    updated_progress = tasks_progress_sum/tasks_size

    self.update(progress: updated_progress)
  end

  def update_progress_tree
    # update milestone progress
    self.update_progress

    # update project progress
    project = self.project
    project.update_progress
  end

end
