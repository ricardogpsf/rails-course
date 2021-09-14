class AddOrganizationRefToPrinters < ActiveRecord::Migration[5.2]
  def change
    add_reference :printers, :organization, foreign_key: true
  end
end
