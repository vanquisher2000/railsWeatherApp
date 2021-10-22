class CreateSearchLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :search_logs do |t|
      t.string :date_issue
      t.string :date_forcast
      t.string :reporting_area
      t.string :state_code
      t.decimal :latitude
      t.decimal :longitude
      t.string :parameter_name
      t.integer :aqi
      t.boolean :action_day
      t.string :disscussion

      t.timestamps
    end
  end
end
