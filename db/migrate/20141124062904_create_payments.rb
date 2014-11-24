class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :pay_date
      t.integer :payment_kinds_id
      t.integer :allowance
      t.timestamps
    end
  end
end
