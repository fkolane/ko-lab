json.extract! prescription, :id, :patient_id, :doctor_id, :status, :user_id, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
