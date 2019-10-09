json.extract! physical_exam, :id, :inspection, :palpation, :percussion, :auscultation, :consultation_id, :status, :created_at, :updated_at
json.url physical_exam_url(physical_exam, format: :json)
