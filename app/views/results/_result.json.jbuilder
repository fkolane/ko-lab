json.extract! result, :id, :analysis_id, :sample_type_id, :analyse_element_id, :normal_value, :result_value, :comment, :created_at, :updated_at
json.url result_url(result, format: :json)
