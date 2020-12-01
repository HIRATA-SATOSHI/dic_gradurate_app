class AddColumnsToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :name, :string
    add_column :staffs, :department, :string
  end
end
