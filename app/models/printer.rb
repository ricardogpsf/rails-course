class Printer < ApplicationRecord
    # validates :name, presence: true
    validates_presence_of :name
    validates :description, presence: true, length: { minimum: 10 }

    belongs_to :organization
end
