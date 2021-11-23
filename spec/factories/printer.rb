FactoryBot.define do
  factory :printer_tatooine, class: Printer do
    name { "Tatooine" }
    description  { "HP Printer" }
    organization { create(:org_hp) }
    printer_type { 'Tatooine' }
  end
end