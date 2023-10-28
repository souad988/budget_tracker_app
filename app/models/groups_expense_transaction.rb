class GroupsExpenseTransaction < ApplicationRecord
  belongs_to :group
  belongs_to :expense_transaction
end
