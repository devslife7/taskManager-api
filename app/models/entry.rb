class Entry < ApplicationRecord
  belongs_to :task
  has_many :user_entries
  has_many :users, :through => :user_entries
end
