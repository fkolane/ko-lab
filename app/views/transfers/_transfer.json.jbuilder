json.extract! transfer, :id, :patient_id, :medical_record_id, :service_id, :doctor_id, :destination_hospital, :destination_service, :reason, :destination_doctor, :destination_doctor_phone, :notes, :status, :user_id, :created_at, :updated_at
json.url transfer_url(transfer, format: :json)
