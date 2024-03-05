class CreateDeposits < ActiveRecord::Migration[7.1]
  def change
    create_table :deposits do |t|
      t.integer :payee_id
      t.integer :amount_in_pennies

      t.timestamps
    end
  end
end
