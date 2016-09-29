json.extract! patient, :id, :first_name, :middle_name, :last_name, :weight, :height, :MRN, :created_at, :updated_at
json.url patient_url(patient, format: :json)