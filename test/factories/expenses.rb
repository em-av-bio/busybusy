FactoryBot.define do
  factory :journey do
    title { 'Journey test' }
    description { 'Journey test description' }
    start_date { Date.today }
    end_date { Date.today + 1.week }
  end
end

FactoryBot.define do
  factory :expense do
    title { 'Expense test' }
    amount { 100 }
    payer { 'gaelle' }
    recipient { 'tom' }
    association :journey
  end
end
