# coding: utf-8

# === PaymentKindクラス
class PaymentKind < ActiveRecord::Base
  varidates :name, presence: true
  varidates :tax_flag, presence: true
  has_many :payment
end
