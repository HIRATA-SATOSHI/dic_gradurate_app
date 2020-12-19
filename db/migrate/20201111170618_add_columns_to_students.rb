class AddColumnsToStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :number, null: false
      t.string :name, default: "", null: false
      t.integer :course, null: false
      t.integer :enrollment_status, null: false
      t.integer :site, null: false
      t.integer :school_year
      t.string :parent_name, null: false
      t.string :phone_number
      t.string :email_address, null: false
      t.text :live_address

      t.timestamps
    end
  end
end
