class API < Grape::API
  prefix 'api'
  version 'v0', using: :path
  format :json

  resource :products do
    get do
      # TODO: avoid raw sql
      sql = "select * from products, product_stores
                      where product_stores.product_id = products.id
                      and store_id=#{params[:store_id]}"
      ActiveRecord::Base.connection.select(sql).to_a
    end

    get ':id' do
      Store.find(params[:id])
    end
  end

  resource :purchase do
    post do
      ProductStore.where(store_id: params[:store_id])

      # TODO: create decremental method in product_store_controller
      params[:purchase].each do |product|
        Product.find_by(barcode_id: product[:barcode_id])
               .product_stores.find_by(store_id: params[:store_id])
               .decrement!(:stock, product[:amount])
      end
    end
  end
end
