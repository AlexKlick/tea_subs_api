class Api::V1::TeaSubscriptionsController < ApplicationController
  def index
    customer = Customer.find_by(id: params[:customer_id])
    if customer.tea_subscriptions.length > 0
      customer.tea_subscriptions.each do |substription|
        TeaSubscriptionSerializer.new(subscripton)
      end
    else
      render json: {
        message: "Customer currently has no subscriptions",
      }, status: 404
    end
    render json: 
  end

  def create

    binding.pry
  end

  def update
    
  end

  private

  def subscription_params
    params.require(:tea_subscriptions).permit(:customer_id, :title, :frequency, :tea)
  end
end
