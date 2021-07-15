class Project < ApplicationRecord
  has_many :reports
  has_many :users, :through => :reports
  has_many :user_projects
  has_many :users, :through => :user_projects
  has_many :milestones

  def update_progress
    milestones_size = self.milestones.size

    milestones_progress_sum = self.milestones.inject(0) {|sum, milestone| sum + milestone[:progress]}
    updated_progress = milestones_progress_sum/milestones_size

    self.update(progress: updated_progress)
  end
end
