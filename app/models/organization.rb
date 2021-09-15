class Organization < ApplicationRecord
  # default_scope { where(active: true) }
  scope :active, -> { where(active: true) }

  has_many :printers
end
