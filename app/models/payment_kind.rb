# coding: utf-8

# === PaymentKindクラス
class PaymentKind < ActiveRecord::Base
  validates :name, presence: true
  validates :tax_flag, presence: true
  has_many :payment
end
