json.extract! input_type, :id, :name, :description, :status, :user_id, :created_at, :updated_at
json.url input_type_url(input_type, format: :json)
