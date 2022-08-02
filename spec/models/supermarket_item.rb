require 'rails_helper'

RSpec. describe SupermarketItem, type: :model do

  describe 'relationships' do
    it  {should belong_to :items}
    it  {should belong_to :supermarkets}
  end


end
