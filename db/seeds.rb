Product.create!([
  {name: "サクサクしっとりチョコ", category: "food", barcode_id: 4903326112852},
  {name: "ぷりぷり鮭おにぎり", category: "food", barcode_id: 4903326112853},
  {name: "読売新聞", category: "newspaper"},
  {name: "片山新聞", category: "newspaper"},
  {name: "Pringles サワークリームオニオン", category: "food", barcode_id: '038000846489'},
  {name: "午後の紅茶 ミルクティー", category: "drink", barcode_id: '4909411055783'},
])
Store.create!([
  {name: "ローソン西早稲田店", beacon_id: "D87CEE67-C2C2-44D2-A847-B728CF8BAAAD"},
  {name: "ローソン東早稲田店", beacon_id: "96996D3D-E135-4330-99C8-3ABF9489FE53"},
])
ProductStore.create!([
  {product_id: 1, store_id: 1, price: 108, stock: 1},
  {product_id: 1, store_id: 2, price: 128, stock: 2},
  {product_id: 2, store_id: 1, price: 208, stock: 3},
  {product_id: 2, store_id: 2, price: 228, stock: 4},
  {product_id: 3, store_id: 1, price: 328, stock: 5},
  {product_id: 4, store_id: 2, price: 428, stock: 15},
  {product_id: 5, store_id: 1, price: 148, stock: 15},
  {product_id: 6, store_id: 1, price: 156, stock: 15},
])
