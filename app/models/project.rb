class Project < ApplicationRecord
  belongs_to :user
  has_many :project_histories, dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
end
