json.extract! receipt_item, :id, :receipt_id, :analysis_id, :price, :created_at, :updated_at
json.url receipt_item_url(receipt_item, format: :json)
