require 'rails_helper'

RSpec.describe "TeaSubscriptions", type: :request do
  describe "GET /index" do
    context 'when a customer checks to see their subscriptions' do 

    end
  end
  describe 'POST /api/v1/create' do
    context 'when a customer posts with params fequency and price'
    it 'creates a new subscription' do
      customer = FactoryBot.create(:customer)
      customer_subs = Customer.first.tea_subscriptions
      expect(customer_subs.length).to eq(0)
      post "/api/v1/customers/#{customer.id}/tea_subscriptions?frequency=monthly&price=10.99"
      expect(response).to have_http_status(:created)
      
      customer_subs = Customer.first.tea_subscriptions
      expect(customer_subs.length).to eq(1)
      expect(customer_subs.first.frequency).to eq("monthly")
      expect(customer_subs.first.price).to eq(10.99)
    end
  end
end
