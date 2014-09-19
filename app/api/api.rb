class API < Grape::API
  prefix 'api'
  version 'v0', using: :path
  format :json

  resource :products do
    get do
      # TODO: avoid raw sql
      sql = "select * from products, product_stores
                      where product_stores.product_id = products.id
                      and store_id = #{params[:store_id]}"
      ActiveRecord::Base.connection.select(sql).to_a
    end

    get ':id' do
      Store.find(params[:id])
    end
  end

  resource :product do
    get do
      # TODO: avoid raw sql
      sql = "select * from product_stores, products
                      where product_stores.product_id = products.id
                      and barcode_id = #{params[:barcode_id]}
                      and product_stores.store_id = #{params[:store_id]}"
      ActiveRecord::Base.connection.select(sql).first
    end
  end

  resource :newspapers do
    get do
      # TODO: Commonise query
      sql = "select * from product_stores, products
                      where product_stores.product_id = products.id
                      and category = #{Product.categories[:newspaper]}
                      and product_stores.store_id = #{params[:store_id]}"
      ActiveRecord::Base.connection.select(sql).to_a
    end
  end

  resource :purchase do
    post do
      ProductStore.where(store_id: params[:store_id])
      returns = []

      # TODO: create decremental method in product_store_controller
      params[:purchase].each do |product|
        item = Product.find_by(barcode_id: product[:barcode_id])
                      .product_stores.find_by(store_id: params[:store_id])
        if item.decrement!(:stock, product[:amount].to_i)
          returns << item
        end
      end
      returns
    end
  end
end
