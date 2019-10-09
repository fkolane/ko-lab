json.extract! arrival_mail, :id, :arrival_date, :origin, :reference, :mail_date, :recipient, :nature, :object, :status, :user_id, :created_at, :updated_at
json.url arrival_mail_url(arrival_mail, format: :json)
