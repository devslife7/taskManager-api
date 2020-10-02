class Task < ApplicationRecord
  belongs_to :milestone
  has_many :user_tasks
  has_many :users, :through => :user_tasks
  has_many :entries
end
