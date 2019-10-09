json.extract! prescription_item, :id, :prescription_id, :medicament_id, :created_at, :updated_at
json.url prescription_item_url(prescription_item, format: :json)
