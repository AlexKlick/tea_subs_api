require 'rails_helper'

RSpec.describe TeaFacade, type: :facade do
  describe 'get_teas' do
    subject(:tea_import) {TeaFacade.get_teas}
    it 'returns an array of tea objects with all attrs present', :vcr do
      tea_import.each do |tea|
        expect(tea).to be_a(Object)
        expect(tea.brew_time).to be_a(Integer)
        expect(tea.description).to be_a(String)
        expect(tea.title).to be_a(String)
      end
    end
  end
end