require 'rails_helper'

describe API do
  include Rack::Test::Methods

  describe 'Product' do
    let!(:product) { FactoryGirl.create(:product) }
    let!(:product_store) { FactoryGirl.create(:product_store, product_id: product.id) }
    let(:response) do
      get '/api/v0/product', { store_id: product_store.store_id,
                               barcode_id: product.barcode_id }
    end

    it 'returns status 200' do
      expect(response.status).to eq(200)
    end

    it 'returns price' do
      expect(JSON.load(response.body).first['price']).to eq(product_store.price)
    end

    it 'returns the amount of stocks' do
      expect(JSON.load(response.body).first['stock']).to eq(product_store.stock)
    end
  end
end
