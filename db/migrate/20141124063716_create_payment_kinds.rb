class CreatePaymentKinds < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_kinds do |t|
      t.string :name
      t.boolean :tax_flag
      t.timestamps
    end
  end
end
