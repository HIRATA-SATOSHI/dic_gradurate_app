class Add < ActiveRecord::Migration[5.2]
  def change
    add_reference :forms, :staff, foreign_key: true
    add_reference :forms, :student, foreign_key: true
  end
end
