class CreateBalances < ActiveRecord::Migration[7.1]
  def change
    create_table :balances do |t|
      t.integer :user_id
      t.integer :amount_in_pennies

      t.timestamps
    end
  end
end
