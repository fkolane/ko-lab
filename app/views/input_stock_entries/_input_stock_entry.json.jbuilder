json.extract! input_stock_entry, :id, :user_id, :created_at, :updated_at
json.url input_stock_entry_url(input_stock_entry, format: :json)
