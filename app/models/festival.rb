class Festival < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :areas, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :roles, through: :assignments, dependent: :destroy
  has_many :users, through: :assignments, dependent: :destroy
  # has_many :participants, through: :assignment, :class_name => "User", :foreign_key => "user_id"
  # belongs_to :admin, :class_name => "User", :foreign_key => "user_id"

  def admin
    admin_assignment = self.assignments.find do |assignment|
      assignment.role.name == "admin"
    end

    admin_assignment.user
  end
end
