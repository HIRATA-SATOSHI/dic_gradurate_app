class ChangeDatatypeDepartmentOfStaffs < ActiveRecord::Migration[5.2]
  def change
    change_column :staffs, :department, 'integer USING CAST(department AS integer)'
  end
end
