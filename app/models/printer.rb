class Printer < ApplicationRecord
    # validates :name, presence: true
    validates_presence_of :name, :printer_type
    validates :description, presence: true, length: { minimum: 10 }

    validate :validate_printer_type

    belongs_to :organization

    def validate_printer_type
        errors.add(:printer_type, "is not a valid type. Choose: Tatooine or Crait") unless ['Tatooine', 'Crait'].include?(printer_type)
    end
end
