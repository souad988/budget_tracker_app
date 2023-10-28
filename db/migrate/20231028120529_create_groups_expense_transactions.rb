class CreateGroupsExpenseTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_expense_transactions do |t|
      t.references :group, null: false, foreign_key: true
      t.references :expense_transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
