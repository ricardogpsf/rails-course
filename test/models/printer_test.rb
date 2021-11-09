require 'test_helper'

class PrinterTest < ActiveSupport::TestCase

  test "required fields validation" do
    printer = Printer.new
    # assert_equal printer.save, false, "Should not save the printer"
    assert_not printer.save, "Should not save the printer"

    messages = printer.errors.messages

    # assert_equal messages.length, 4
    assert_equal messages[:name], ["can't be blank"]
    assert_equal messages[:description], ["can't be blank", "is too short (minimum is 10 characters)"]
    assert_equal messages[:organization], ["must exist"]
    assert_equal messages[:printer_type], ["can't be blank", "is not a valid type. Choose: Tatooine or Crait"]
  end

  test "should be valid printer" do
    org = Organization.create(name: "HP", description: "My description", active: true)
    printer = Printer.new(name: "Printer 1", description: "My description", organization: org, printer_type: "Tatooine")

    assert printer.save
  end
end

# Class 6:  
# New feature to be implemented: a printer must have a type and it should be one of two values: Tatooine or Crait.
#
# printer_type -> string, ['Tatooine', 'Crait']