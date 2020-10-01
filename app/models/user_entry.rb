class UserEntry < ApplicationRecord
  belongs_to :user
  belongs_to :entry
end
