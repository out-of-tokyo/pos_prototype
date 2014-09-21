require 'rails_helper'

describe API do
  include Rack::Test::Methods

  describe 'Purchase' do
    let!(:product) { FactoryGirl.create(:product) }
    let!(:store) { FactoryGirl.create(:store) }
    let!(:product_store) { FactoryGirl.create(:product_store,
                                              product_id: product.id,
                                              store_id: store.id) }
    let!(:purchaced_products) { { beacon_id: product_store.store.beacon_id,
                                  purchase: [{
                                    barcode_id: product.barcode_id,
                                    amount: 2,
                                  }]
                                }
                              }

    context 'purchase products' do
      let(:response_to_purchase) do
        post '/api/v0/purchase', purchaced_products
      end

      it 'returns status 201' do
        expect(response_to_purchase.status).to eq(201)
      end

      it 'returns the amount of stocks' do
        expect(JSON.load(response_to_purchase.body).first['price']).to eq(product_store.price)
      end

      it 'decrements the stocks' do
        expect(JSON.load(response_to_purchase.body).first['stock']).to eq(FactoryGirl.build(:product_store).stock - 2)
      end
    end

    context 'cancel purchase' do
      let(:response_to_cancel_purchase) do
        post '/api/v0/cancel_purchase', purchaced_products
      end

      it 'returns status 201' do
        expect(response_to_cancel_purchase.status).to eq(201)
      end

      it 'returns the amount of stocks' do
        expect(JSON.load(response_to_cancel_purchase.body).first['price']).to eq(product_store.price)
      end

      it 'decrements the stocks' do
        expect(JSON.load(response_to_cancel_purchase.body).first['stock']).to eq(FactoryGirl.build(:product_store).stock + 2)
      end
    end
  end
end
