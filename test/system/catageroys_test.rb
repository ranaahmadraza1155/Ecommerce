require "application_system_test_case"

class CatageroysTest < ApplicationSystemTestCase
  setup do
    @catageroy = catageroys(:one)
  end

  test "visiting the index" do
    visit catageroys_url
    assert_selector "h1", text: "Catageroys"
  end

  test "should create catageroy" do
    visit catageroys_url
    click_on "New catageroy"

    fill_in "Name", with: @catageroy.name
    click_on "Create Catageroy"

    assert_text "Catageroy was successfully created"
    click_on "Back"
  end

  test "should update Catageroy" do
    visit catageroy_url(@catageroy)
    click_on "Edit this catageroy", match: :first

    fill_in "Name", with: @catageroy.name
    click_on "Update Catageroy"

    assert_text "Catageroy was successfully updated"
    click_on "Back"
  end

  test "should destroy Catageroy" do
    visit catageroy_url(@catageroy)
    click_on "Destroy this catageroy", match: :first

    assert_text "Catageroy was successfully destroyed"
  end
end
