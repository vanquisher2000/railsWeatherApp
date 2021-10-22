json.extract! search_log, :id, :date_issue, :date_forcast, :reporting_area, :state_code, :latitude, :longitude, :parameter_name, :aqi, :action_day, :disscussion, :created_at, :updated_at
json.url search_log_url(search_log, format: :json)
