require 'rails_helper'

describe API do
  include Rack::Test::Methods

  describe 'Purchase' do
    let!(:product) { FactoryGirl.create(:product) }
    let!(:store) { FactoryGirl.create(:store) }
    let!(:product_store) { FactoryGirl.create(:product_store,
                                              product_id: product.id,
                                              store_id: store.id) }

    let(:response) do
      post '/api/v0/purchase', { beacon_id: product_store.store.beacon_id,
                                 purchase: [{
                                   barcode_id: product.barcode_id,
                                   amount: 2,
                                 }]
                               }
    end

    it 'returns status 201' do
      expect(response.status).to eq(201)
    end

    it 'returns the amount of stocks' do
      expect(JSON.load(response.body).first['price']).to eq(product_store.price)
    end

    it 'decrements the stocks' do
      expect(JSON.load(response.body).first['stock']).to eq(FactoryGirl.build(:product_store).stock - 2)
    end
  end
end
