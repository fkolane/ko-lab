json.extract! patient, :id, :identifier, :first_name, :last_name, :birth_date, :gender, :ethnic_group, :born_place, :city, :neighbourhood, :address, :phone, :insurance_id, :insurance_identifier, :user_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
