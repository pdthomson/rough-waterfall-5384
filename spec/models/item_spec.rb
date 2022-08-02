require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should have_many :customers }
    it { should have_many(:customers).through(:supermarket_items) }
  end

  
end
