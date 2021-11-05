require 'rails_helper'

RSpec.describe "TeaSubscriptions", type: :request do
  describe "GET /index" do
    context 'when a customer checks to see their subscriptions' do
      before {
        @customer = FactoryBot.create(:customer)
        @customer_subs = Customer.first.tea_subscriptions
        expect(@customer_subs.length).to eq(0)
        post "/api/v1/customers/#{@customer.id}/tea_subscriptions?frequency=monthly&price=10.99"
        post "/api/v1/customers/#{@customer.id}/tea_subscriptions?frequency=bi-monthly&price=12.19"
      }
      it 'returns a json formatted list of their subs' do
        get "/api/v1/customers/#{@customer.id}/tea_subscriptions"
        res = JSON.parse(response.body,symbolize_names: true)
        expect(res).to be_a(Hash)
        expect(res[:data]).to be_a(Array)
        expect(res[:data][0][:id]).to be_a(String)
        expect(res[:data][0][:type]).to eq("TeaSubscription")
        expect(res[:data][0][:attributes]).to be_a(Hash)
        expect(res[:data][0][:attributes][:title]).to be_a(String)
        expect(res[:data][0][:attributes][:price]).to be_a(Float)
        expect(res[:data][0][:attributes][:status]).to be_a(String)
        expect(res[:data][0][:attributes][:frequency]).to be_a(String)
        expect(res[:data][0][:relationships]).to be_a(Hash)
        expect(res[:data][0][:relationships][:customer]).to be_a(Hash)
        expect(res[:data][0][:relationships][:customer][:data]).to be_a(Hash)
        expect(res[:data][0][:relationships][:customer][:data][:id]).to be_a(String)
        expect(res[:data][0][:relationships][:customer][:data][:type]).to be_a(String)
        expect(res[:data][0][:relationships][:customer][:data][:type]).to eq('Customer')
      end
    end
    context 'when a customer with no subscriptions tries to chech their subs' do
      before {
        @customer = FactoryBot.create(:customer)
        @customer_subs = Customer.first.tea_subscriptions
      }
      it 'returns a json formatted list of their subs' do
        get "/api/v1/customers/#{@customer.id}/tea_subscriptions"
        res = JSON.parse(response.body,symbolize_names: true)
        expect(res).to be_a(Hash)
        expect(res[:message]).to eq("Customer currently has no subscriptions")
        expect(response.status).to eq(404)
      end
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
      expect(response.body).to eq(" ")

      customer_subs = Customer.first.tea_subscriptions
      expect(customer_subs.length).to eq(1)
      expect(customer_subs.first.frequency).to eq("monthly")
      expect(customer_subs.first.price).to eq(10.99)
    end
    context 'when a customer does not exist and tries to create a sub'
    it "doesn't create a sub and returns status 404" do
      post "/api/v1/customers/1/tea_subscriptions?frequency=monthly&price=10.99"
      expect(response).to have_http_status(:not_found)
      res = JSON.parse(response.body,symbolize_names: true)
      expect(res[:message]).to eq("Customer does not exist!")
      expect(response.status).to eq(404)
      expect(res).to be_a(Hash)
    end
  end
  describe "PUT /update" do
    context 'when a customer cancels a subscription' do
      before {
        @customer = FactoryBot.create(:customer)
        @customer_subs = Customer.first.tea_subscriptions
        post "/api/v1/customers/#{@customer.id}/tea_subscriptions?frequency=bi-monthly&price=12.19"
    }
      it 'returns a status 202 and the subscription has been updated to deactivated' do
        put "/api/v1/customers/#{@customer.id}/tea_subscriptions/#{@customer_subs.first.id}",params: {
          url: 'https://localhost:3000',
          customer_id: @customer.id,
          id: @customer_subs.first.id
        }
        expect(response.status).to eq(202)
        expect(response.body).to eq(" ")
        subs_status = Customer.first.tea_subscriptions.first.status
        expect(subs_status).to eq('deactivated')
      end
    end
    context 'when a person who is not the customer tries to deactivate a sub' do
      before {
        @customer = FactoryBot.create(:customer)
        @customer_subs = Customer.first.tea_subscriptions
        post "/api/v1/customers/#{@customer.id}/tea_subscriptions?frequency=bi-monthly&price=12.19"
    }
      it 'returns a status 403 and does not alter the sub' do
        put "/api/v1/customers/2/tea_subscriptions/#{@customer_subs.first.id}",params: {
          url: 'https://localhost:3000',
          customer_id: @customer.id,
          id: @customer_subs.first.id
        }
        expect(response.status).to eq(403)
        expect(response.body).to eq(" ")
        subs_status = Customer.first.tea_subscriptions.first.status
        expect(subs_status).to eq('active')
      end
    end
  end
end
