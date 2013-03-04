
FactoryGirl.define do
  factory :place, :class => Refinery::Places::Place do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

