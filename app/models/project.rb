class Project < ApplicationRecord
  has_many :reports
  has_many :users, :through => :reports
  has_many :user_projects
  has_many :users, :through => :user_projects
  has_many :milestones

  def update_progress
    milestone_array = self.milestones
    milestones_size = milestone_array.size === 0 ? 1 : milestone_array.size

    milestones_progress_sum = milestone_array.inject(0) {|sum, milestone| sum + milestone[:progress]}
    updated_progress = milestones_progress_sum/milestones_size

    self.update(progress: updated_progress)
  end
end
