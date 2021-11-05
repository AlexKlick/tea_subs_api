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
    #render json: 
  end

  def create
    customer = Customer.find_by(id: subscription_params[:customer_id])
    if customer 
      teas = TeaFacade.get_teas
      tea_selection = teas.sample
      new_sub = customer.tea_subscriptions.new(
        frequency: subscription_params[:frequency], 
        price: subscription_params[:price],
        status: 'active',
        title: "#{tea_selection.title}every#{subscription_params[:frequency]}",
        id: tea_selection.id)
      if new_sub.save
        render status: 201
      end
    else
      render json: {
        message: "Customer does not exist!",
      }, status: 404
    end
  end

  def update
    
  end

  private

  def subscription_params
    params.permit(:customer_id, :price, :frequency, :tea)
  end
end
