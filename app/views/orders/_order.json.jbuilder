json.extract! order, :id, :medicament_family_id, :medicament_id, :unit_price, :quantity, :vat, :total_amount, :delivery_time, :provider_id, :status, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
