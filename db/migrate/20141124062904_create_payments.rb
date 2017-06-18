class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.date :pay_day
      t.integer :payment_kind_id
      t.integer :allowance
      t.timestamps
    end
  end
end
