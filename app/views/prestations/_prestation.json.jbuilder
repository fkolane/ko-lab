json.extract! prestation, :id, :name, :price, :status, :user_id, :created_at, :updated_at
json.url prestation_url(prestation, format: :json)
