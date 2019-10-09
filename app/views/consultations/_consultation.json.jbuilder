json.extract! consultation, :id, :patient_id, :medical_record_id, :reason, :exit_diagnostic, :disease_history, :user_id, :created_at, :updated_at
json.url consultation_url(consultation, format: :json)
