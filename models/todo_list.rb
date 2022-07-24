class TodoList < ApplicationRecord
  belongs_to :event
  validates :content, presence: true

  def completed?
    !completed_at.blank?
  end
end
