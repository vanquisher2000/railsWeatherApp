require "application_system_test_case"

class SearchLogsTest < ApplicationSystemTestCase
  setup do
    @search_log = search_logs(:one)
  end

  test "visiting the index" do
    visit search_logs_url
    assert_selector "h1", text: "Search Logs"
  end

  test "creating a Search log" do
    visit search_logs_url
    click_on "New Search Log"

    fill_in "Action day", with: @search_log.action_day
    fill_in "Aqi", with: @search_log.aqi
    fill_in "Date forcast", with: @search_log.date_forcast
    fill_in "Date issue", with: @search_log.date_issue
    fill_in "Disscussion", with: @search_log.disscussion
    fill_in "Latitude", with: @search_log.latitude
    fill_in "Longitude", with: @search_log.longitude
    fill_in "Parameter name", with: @search_log.parameter_name
    fill_in "Reporting area", with: @search_log.reporting_area
    fill_in "State code", with: @search_log.state_code
    click_on "Create Search log"

    assert_text "Search log was successfully created"
    click_on "Back"
  end

  test "updating a Search log" do
    visit search_logs_url
    click_on "Edit", match: :first

    fill_in "Action day", with: @search_log.action_day
    fill_in "Aqi", with: @search_log.aqi
    fill_in "Date forcast", with: @search_log.date_forcast
    fill_in "Date issue", with: @search_log.date_issue
    fill_in "Disscussion", with: @search_log.disscussion
    fill_in "Latitude", with: @search_log.latitude
    fill_in "Longitude", with: @search_log.longitude
    fill_in "Parameter name", with: @search_log.parameter_name
    fill_in "Reporting area", with: @search_log.reporting_area
    fill_in "State code", with: @search_log.state_code
    click_on "Update Search log"

    assert_text "Search log was successfully updated"
    click_on "Back"
  end

  test "destroying a Search log" do
    visit search_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Search log was successfully destroyed"
  end
end
