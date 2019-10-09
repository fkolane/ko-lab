json.extract! waiting_list, :id, :receipt_id, :service_id, :doctor_id, :status, :user_id, :created_at, :updated_at
json.url waiting_list_url(waiting_list, format: :json)
