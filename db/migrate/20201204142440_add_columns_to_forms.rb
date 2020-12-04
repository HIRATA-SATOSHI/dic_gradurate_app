class AddColumnsToForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.string :student_id, null: false
      t.string :name, null: false
      t.date :application_date, null: false
      t.integer :classification, null: false
      t.date :month, null: false
      t.date :f_month, null: false
      t.integer :reason, null:false
      t.text :comment
      t.text :processed_staff
      t.boolean :cancel, default: false

      t.timestamps      
    end
  end
end
