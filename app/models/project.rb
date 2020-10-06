class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, :through => :user_projects
  has_many :milestones

  def update_progress
    milestones_size = self.milestones.size

    sum = self.milestones.inject(0) {|sum, milestone| sum + milestone[:progress]}
    amount = sum/milestones_size

    self.update(progress: amount)
  end
end
