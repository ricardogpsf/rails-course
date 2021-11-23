require 'rails_helper'

RSpec.describe Printer, type: :model do
  context 'when creating' do
    before do
      puts "Before each test example"
    end

    it 'validates the fields properly' do
      printer = Printer.create 
      messages = printer.errors.messages
      
      expect(messages.length).to eq(4)
      expect(messages[:name]).to eq(["can't be blank"])
      expect(messages[:description]).to eq(["can't be blank", "is too short (minimum is 10 characters)"])
      expect(messages[:organization]).to eq(["must exist"])
      expect(messages[:printer_type]).to eq(["can't be blank", "is not a valid type. Choose: Tatooine or Crait"])
    end

    it 'validates with exception' do
      expect { Printer.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  
  context 'new context' do
    it {}
    it {}
  end
end