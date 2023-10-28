class RemoveGroupFromExpenseTransaction < ActiveRecord::Migration[7.0]
  def change
    remove_reference :expense_transactions, :group, null: false, foreign_key: true
  end
end
