class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @current_plan = @user.current_plan
    @active_subscription = @user.active_subscription
    @available_plans = Plan.active.where.not(id: @current_plan&.id)
  end
end
