class CreatePaymentKinds < ActiveRecord::Migration
  def change
    create_table :payment_kinds do |t|
      t.string :name
      t.boolean :tax_flag
      t.timestamps
    end
  end
end
