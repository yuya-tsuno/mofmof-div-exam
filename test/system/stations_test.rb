require "application_system_test_case"

class StationsTest < ApplicationSystemTestCase
  setup do
    @station = stations(:one)
  end

  test "visiting the index" do
    visit stations_url
    assert_selector "h1", text: "Stations"
  end

  test "creating a Station" do
    visit stations_url
    click_on "New Station"

    fill_in "Line", with: @station.line
    fill_in "Name", with: @station.name
    fill_in "Time", with: @station.time
    click_on "Create Station"

    assert_text "Station was successfully created"
    click_on "Back"
  end

  test "updating a Station" do
    visit stations_url
    click_on "Edit", match: :first

    fill_in "Line", with: @station.line
    fill_in "Name", with: @station.name
    fill_in "Time", with: @station.time
    click_on "Update Station"

    assert_text "Station was successfully updated"
    click_on "Back"
  end

  test "destroying a Station" do
    visit stations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Station was successfully destroyed"
  end
end
