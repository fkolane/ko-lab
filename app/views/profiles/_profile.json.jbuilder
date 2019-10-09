json.extract! profile, :id, :first_name, :last_name, :gender, :birth_date, :phone, :service_id, :role_id, :specialty_one, :specialty_two, :user_id, :status, :created_at, :updated_at
json.url profile_url(profile, format: :json)
