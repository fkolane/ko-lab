json.extract! social_case, :id, :patient_id, :medical_record_id, :percentage, :status, :user_id, :created_at, :updated_at
json.url social_case_url(social_case, format: :json)
