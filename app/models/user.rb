class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :subscriptions, dependent: :destroy
  has_one :active_subscription, -> { active }, class_name: 'Subscription'
  has_many :projects, dependent: :destroy
  
  def current_plan
    active_subscription&.plan
  end
  
  def has_active_subscription?
    active_subscription.present?
  end
end
