class User < ApplicationRecord
  has_secure_password

  has_many :user_projects
  has_many :projects, :through => :user_projects
  has_many :user_tasks
  has_many :tasks, :through => :user_tasks

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
