class Assignment < ApplicationRecord
  belongs_to :festival
  belongs_to :role
  belongs_to :user
end
