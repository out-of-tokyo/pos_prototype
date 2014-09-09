Product.create!([
  {name: "サクサクしっとりチョコ", barcode_id: 4903326112852},
  {name: "ぷりぷり鮭おにぎり", barcode_id: 4903326112853},
])
Store.create!([
  {name: "ローソン西早稲田店", beacon_id: "D87CEE67-C2C2-44D2-A847-B728CF8BAAAD"},
  {name: "ローソン東早稲田店", beacon_id: "96996D3D-E135-4330-99C8-3ABF9489FE53"},
])
ProductStore.create!([
  {product_id: 1, store_id: 1, price: 108, stock: 1},
  {product_id: 1, store_id: 2, price: 108, stock: 2},
  {product_id: 2, store_id: 1, price: 208, stock: 3},
  {product_id: 2, store_id: 2, price: 228, stock: 4},
])
