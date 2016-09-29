json.extract! encounter, :id, :patient_mrn, :visit_number, :admitted_at, :discharged_at, :location, :room, :bed, :created_at, :updated_at
json.url encounter_url(encounter, format: :json)