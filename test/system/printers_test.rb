require "application_system_test_case"

class PrintersTest < ApplicationSystemTestCase
  setup do
    @printer = printers(:one)
  end

  test "visiting the index" do
    visit printers_url
    assert_selector "h1", text: "Printers"
  end

  test "creating a Printer" do
    visit printers_url
    click_on "New Printer"

    fill_in "Description", with: @printer.description
    fill_in "Name", with: @printer.name
    click_on "Create Printer"

    assert_text "Printer was successfully created"
    click_on "Back"
  end

  test "updating a Printer" do
    visit printers_url
    click_on "Edit", match: :first

    fill_in "Description", with: @printer.description
    fill_in "Name", with: @printer.name
    click_on "Update Printer"

    assert_text "Printer was successfully updated"
    click_on "Back"
  end

  test "destroying a Printer" do
    visit printers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Printer was successfully destroyed"
  end
end
