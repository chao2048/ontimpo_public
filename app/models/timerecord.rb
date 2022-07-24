class Timerecord < ApplicationRecord
  belongs_to :user
  validates :timetype, presence: true
  validates :period, presence: true
end
