# coding: utf-8

require 'rails_helper'

RSpec.describe PaymentKind, type: :model do
  presence_attr = %w(name tax_flag)
  presence_attr.each do |attr|
    it { is_expected.to validate_presence_of(attr) }
  end

  it { is_expected.to have_many(:payment) }
end
