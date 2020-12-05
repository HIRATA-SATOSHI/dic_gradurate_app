class Add < ActiveRecord::Migration[5.2]
  def change
    add_reference :forms, :staffs, foreign_key: true
  end
end
