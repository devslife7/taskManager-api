class Entry < ApplicationRecord
  belongs_to :task
  has_many :user_entries
  has_many :users, :through => :user_entries

  def update_tree

    # udpate task progress
    task = self.task
    task.update(progress: self.progress)

    # update milestones progress
    milestone = task.milestone

    # milestone.tasks.map do |task|
      
    # end

    # update project progress
    project = milestone.project

    
    # project = task.project
    # sum1 = 0
    # project.tasks.each do |task|
    #   sum1 = sum1 + task.completion_percentage.to_i
    # end
    # avg = (sum1/project.tasks.length).ceil()

    # project.update({completion_percentage: "#{avg}%"})
    byebug
    "updating #{self.name}"
  end
end
