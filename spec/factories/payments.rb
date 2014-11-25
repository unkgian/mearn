# coding: utf-8

FactoryGirl.define do
  factory :payment do
    pay_date Date.today
    payment_kind_id 1
    allowance 100000
  end

  # This will use the User class (Admin would have been guessed)
  factory :payment_1, class: Payment do
    id 1
    pay_date Date.today
    payment_kind_id 1
    allowance 100000
  end
end