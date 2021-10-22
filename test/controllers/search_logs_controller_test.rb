require "test_helper"

class SearchLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_log = search_logs(:one)
  end

  test "should get index" do
    get search_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_search_log_url
    assert_response :success
  end

  test "should create search_log" do
    assert_difference('SearchLog.count') do
      post search_logs_url, params: { search_log: { action_day: @search_log.action_day, aqi: @search_log.aqi, date_forcast: @search_log.date_forcast, date_issue: @search_log.date_issue, disscussion: @search_log.disscussion, latitude: @search_log.latitude, longitude: @search_log.longitude, parameter_name: @search_log.parameter_name, reporting_area: @search_log.reporting_area, state_code: @search_log.state_code } }
    end

    assert_redirected_to search_log_url(SearchLog.last)
  end

  test "should show search_log" do
    get search_log_url(@search_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_log_url(@search_log)
    assert_response :success
  end

  test "should update search_log" do
    patch search_log_url(@search_log), params: { search_log: { action_day: @search_log.action_day, aqi: @search_log.aqi, date_forcast: @search_log.date_forcast, date_issue: @search_log.date_issue, disscussion: @search_log.disscussion, latitude: @search_log.latitude, longitude: @search_log.longitude, parameter_name: @search_log.parameter_name, reporting_area: @search_log.reporting_area, state_code: @search_log.state_code } }
    assert_redirected_to search_log_url(@search_log)
  end

  test "should destroy search_log" do
    assert_difference('SearchLog.count', -1) do
      delete search_log_url(@search_log)
    end

    assert_redirected_to search_logs_url
  end
end
