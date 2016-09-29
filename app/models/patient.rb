class Patient < ActiveRecord::Base
	has_many :encounter, :foreign_key => :patient_mrn, :primary_key => "MRN"
	validates :first_name, :middle_name, presence: true, length: { maximum: 50 }
	validates :MRN, presence: true, uniqueness: { case_sensitive: false }
end
