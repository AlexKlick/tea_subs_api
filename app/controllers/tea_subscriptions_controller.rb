class TeaSubscriptionsController < ApplicationController
  def index
  
  end

  def create
    binding.pry
  end

  def update
    
  end

  private

  def subscription_params
    params.require(:tea_subscriptions).permit(:customer_id, :id, )
  end
end
