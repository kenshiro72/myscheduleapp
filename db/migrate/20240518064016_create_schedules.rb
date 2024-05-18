class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :startdate
      t.date :enddate
      t.boolean :allday
      t.text :memo

      t.timestamps
    end
  end
end
