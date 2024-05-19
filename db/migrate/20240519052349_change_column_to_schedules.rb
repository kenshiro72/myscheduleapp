class ChangeColumnToSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:schedules, :allday, from: nil, to: false)
  end
end
