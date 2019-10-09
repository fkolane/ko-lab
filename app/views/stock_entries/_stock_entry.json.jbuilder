json.extract! stock_entry, :id, :medicament_family_id, :medicament_id, :reason, :provider_id, :quantity, :unit, :delivery_number, :status, :user_id, :created_at, :updated_at
json.url stock_entry_url(stock_entry, format: :json)
