require 'rails_helper'

describe API do
  include Rack::Test::Methods

  describe 'Product' do
    let!(:product) { FactoryGirl.create(:product) }
    let!(:store) { FactoryGirl.create(:store) }
    let!(:product_store) { FactoryGirl.create(:product_store,
                                              product_id: product.id,
                                              store_id: store.id) }
    let(:response) do
      get '/api/v0/product', { beacon_id: product_store.store.beacon_id,
                               barcode_id: product_store.product.barcode_id }
    end

    it 'returns status 200' do
      expect(response.status).to eq(200)
    end

    it 'returns price' do
      expect(JSON.load(response.body)['price']).to eq(product_store.price)
    end

    it 'returns the amount of stocks' do
      expect(JSON.load(response.body)['stock']).to eq(product_store.stock)
    end
  end
end
