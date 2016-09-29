class Encounter < ActiveRecord::Base
	belongs_to :patient, :foreign_key => :MRN, :primary_key => "patient_mrn"
	validates :patient_mrn, :visit_number, :admitted_at, presence: true
end
