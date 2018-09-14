class Area < ApplicationRecord
  has_many :events, dependent: :destroy
  belongs_to :festival
end
