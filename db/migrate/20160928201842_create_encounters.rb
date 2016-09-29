class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :patient_mrn
      t.integer :visit_number
      t.datetime :admitted_at
      t.datetime :discharged_at
      t.string :location
      t.string :room
      t.integer :bed

      t.timestamps null: false
    end
  end
end
