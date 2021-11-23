FactoryBot.define do
  factory :org_hp, class: Organization do
    name { "HP" }
    description  { "HP organization" }
    active { true }
  end
end