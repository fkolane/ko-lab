json.extract! analysis, :id, :patient_id, :doctor_id, :name, :price, :requesting_doctor, :sample_date, :sample_id, :validated_by, :validation_date, :status, :user_id, :created_at, :updated_at
json.url analysis_url(analysis, format: :json)
