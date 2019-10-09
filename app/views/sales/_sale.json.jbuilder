json.extract! sale, :id, :patient_type, :patient_id, :medicament_family_id, :medicament_id, :unit_price, :quantity, :vat, :total_amount, :status, :user_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
