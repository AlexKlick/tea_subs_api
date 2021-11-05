class Api::V1::TeaSubscriptionsController < ApplicationController
  def index
    customer = Customer.find_by(id: params[:customer_id])
    if customer.tea_subscriptions.length > 0
      options = {}
      options[:is_collection]
      subs = TeaSubscriptionSerializer.new(customer.tea_subscriptions, options).serializable_hash
      render json: subs
    else
      render json: {
        message: "Customer currently has no subscriptions",
      }, status: 404
    end
  end

  def create
    customer = Customer.find_by(id: subscription_params[:customer_id])
    if customer 
      teas = TeaFacade.get_teas
      teas.select{ |c| customer.tea_subscriptions.include?(c.title)}
      already_subed = customer.tea_subscriptions.map{|tea| tea.title}
      teas = teas.select{ |tea| !already_subed.include?(tea.title)}
      tea_selection = teas.sample
      new_sub = customer.tea_subscriptions.new(
        frequency: subscription_params[:frequency], 
        price: subscription_params[:price],
        status: 'active',
        title: "#{tea_selection.title}#{subscription_params[:frequency]}",
        tea_external_id: tea_selection.id)
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
    sub = TeaSubscription.find_by(id: subscription_params[:id])
    if sub.present?
      if sub.customer_id == subscription_params[:customer_id].to_i
        sub.update(status: 'deactivated')
        render status: 202
      else 
        render status: 403
      end
    end
  end

  private

  def subscription_params
    params.permit(:customer_id, :price, :frequency, :tea, :id)
  end
end
