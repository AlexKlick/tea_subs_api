require 'rails_helper'

describe TeaService, type: :service do
  describe 'get_teas' do
    subject(:teas) {TeaService.get_teas}
    context 'when I make a request to get the teas', :vcr do
      it 'returns all of the teas available as an array of objects' do
        teas
        teas.each do |tea|
          expect(tea).to be_a(Hash)
          expect(tea[:name]).to be_a(String)
          expect(tea[:description]).to be_a(String)
          expect(tea[:brew_time]).to be_a(Integer)
          expect(tea[:temperature]).to be_a(Integer)
        end
      end
    end
  end
end