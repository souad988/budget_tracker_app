json.extract! expense_transaction, :id, :name, :amount, :user_id, :group_id, :created_at, :updated_at
json.url expense_transaction_url(expense_transaction, format: :json)
