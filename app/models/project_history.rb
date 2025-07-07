class ProjectHistory < ApplicationRecord
  belongs_to :project
  belongs_to :user
  
  validates :action, presence: true
  validates :description, presence: true
  
  enum action: { created: 0, updated: 1, deleted: 2 }
  
  scope :recent, -> { order(created_at: :desc) }
end
