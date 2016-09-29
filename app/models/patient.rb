class Patient < ActiveRecord::Base
	has_many :encounter, :foreign_key => :patient_mrn, :primary_key => "MRN"
	validates :first_name, :MRN, :middle_name, presence: true
end
