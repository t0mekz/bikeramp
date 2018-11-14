FactoryBot.define do
  factory :trip do
    start_address { "Plac Europejski 2, Warszawa, Polska" }
    destination_address  { "Plac Europejski 2, Warszawa, Polska" }
    price { 2.20 }
    date { Date.today }
  end
end