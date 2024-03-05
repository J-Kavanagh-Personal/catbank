class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :payee_id
      t.integer :payer_id
      t.integer :amount_in_pennies
      t.string :reference

      t.timestamps
    end
  end
end
