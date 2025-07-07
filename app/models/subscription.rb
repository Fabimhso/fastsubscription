class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  
  validates :status, presence: true, inclusion: { in: %w[active canceled past_due unpaid trialing] }
  validates :stripe_subscription_id, uniqueness: true, allow_nil: true
  
  scope :active, -> { where(status: 'active') }
  scope :canceled, -> { where(status: 'canceled') }
  
  def active?
    status == 'active'
  end
  
  def canceled?
    status == 'canceled'
  end
  
  def past_due?
    status == 'past_due'
  end
  
  def unpaid?
    status == 'unpaid'
  end
  
  def trialing?
    status == 'trialing'
  end
end
