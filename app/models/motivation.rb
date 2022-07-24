class Motivation < ApplicationRecord
    belongs_to :user
    validates :goal, presence: true
    validates :reward, presence: true
end
