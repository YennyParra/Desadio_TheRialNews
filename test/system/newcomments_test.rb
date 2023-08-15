require "application_system_test_case"

class NewcommentsTest < ApplicationSystemTestCase
  setup do
    @newcomment = newcomments(:one)
  end

  test "visiting the index" do
    visit newcomments_url
    assert_selector "h1", text: "Newcomments"
  end

  test "should create newcomment" do
    visit newcomments_url
    click_on "New newcomment"

    fill_in "Body", with: @newcomment.body
    fill_in "Pcuser", with: @newcomment.pcuser_id
    fill_in "Report", with: @newcomment.report_id
    click_on "Create Newcomment"

    assert_text "Newcomment was successfully created"
    click_on "Back"
  end

  test "should update Newcomment" do
    visit newcomment_url(@newcomment)
    click_on "Edit this newcomment", match: :first

    fill_in "Body", with: @newcomment.body
    fill_in "Pcuser", with: @newcomment.pcuser_id
    fill_in "Report", with: @newcomment.report_id
    click_on "Update Newcomment"

    assert_text "Newcomment was successfully updated"
    click_on "Back"
  end

  test "should destroy Newcomment" do
    visit newcomment_url(@newcomment)
    click_on "Destroy this newcomment", match: :first

    assert_text "Newcomment was successfully destroyed"
  end
end
