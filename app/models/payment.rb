# coding: utf-8

# === Paymentクラス
class Payment < ActiveRecord::Base
  validates :pay_date, presence: true
  validates  :payment_kinds_id, presence: true
  validates  :allowance, presence: true

  belongs_to :payment_kind
end
