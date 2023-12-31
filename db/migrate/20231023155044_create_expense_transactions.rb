class CreateExpenseTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_transactions do |t|
      t.string :name
      t.float :amount
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
