# coding: utf-8

require 'rails_helper'

RSpec.describe Payment, type: :model do
  presence_attr = %w(pay_date payment_kind_id allowance)
  presence_attr.each do |attr|
    it { is_expected.to validate_presence_of(attr) }
  end

  it { is_expected.to belong_to(:payment_kind) }
end
