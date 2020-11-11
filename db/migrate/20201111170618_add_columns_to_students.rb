class AddColumnsToStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :course
      t.integer :enrollment_status
      t.integer :site
      t.integer :school_year
      t.string :parent_name
      t.string :phone_number
      t.string :email_address
      t.text :live_address
    end
  end
end
