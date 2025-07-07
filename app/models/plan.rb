class Plan < ApplicationRecord
  has_many :subscriptions, dependent: :restrict_with_error
  
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :active, inclusion: { in: [true, false] }
  
  scope :active, -> { where(active: true) }
  
  def features_list
    features.present? ? JSON.parse(features) : []
  rescue JSON::ParserError
    []
  end
  
  def formatted_price
    "R$ #{price}"
  end
end
