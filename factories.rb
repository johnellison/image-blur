require 'factory_girl'

FactoryGirl.define do
  factory :image do
    array [
      [0,0,0,1,0,1,0],
      [0,0,1,0,1,0,1],
      [0,1,0,0,0,0,0],
      [1,0,0,0,0,0,1]
      ]
  end
end