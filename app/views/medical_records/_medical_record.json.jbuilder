json.extract! medical_record, :id, :patient_id, :status, :user_id, :created_at, :updated_at
json.url medical_record_url(medical_record, format: :json)
