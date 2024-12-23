require "application_system_test_case"

class TemperaturesTest < ApplicationSystemTestCase
  setup do
    @temperature = temperatures(:one)
  end

  test "visiting the index" do
    visit temperatures_url
    assert_selector "h1", text: "Temperatures"
  end

  test "should create temperature" do
    visit temperatures_url
    click_on "New temperature"

    fill_in "Value", with: @temperature.value
    click_on "Create Temperature"

    assert_text "Temperature was successfully created"
    click_on "Back"
  end

  test "should update Temperature" do
    visit temperature_url(@temperature)
    click_on "Edit this temperature", match: :first

    fill_in "Value", with: @temperature.value
    click_on "Update Temperature"

    assert_text "Temperature was successfully updated"
    click_on "Back"
  end

  test "should destroy Temperature" do
    visit temperature_url(@temperature)
    click_on "Destroy this temperature", match: :first

    assert_text "Temperature was successfully destroyed"
  end
end
