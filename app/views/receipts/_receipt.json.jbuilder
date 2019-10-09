json.extract! receipt, :id, :patient_id, :patient_identifier, :service_id, :doctor, :price, :status, :user_id, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
