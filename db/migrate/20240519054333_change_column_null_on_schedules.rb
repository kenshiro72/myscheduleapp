class ChangeColumnNullOnSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column_null :schedules, :allday, false
  end
end
