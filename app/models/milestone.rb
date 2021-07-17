class Milestone < ApplicationRecord
  belongs_to :project
  has_many :tasks

  def update_progress
    task_array = self.tasks
    tasks_size = task_array.size

    if !task_array.empty?
      tasks_progress_sum = task_array.inject(0) {|sum, task| sum + task[:progress]}

      updated_progress = tasks_progress_sum/tasks_size
    else
      updated_progress = 0 #when task array is empty the progress is set to 0
    end

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
