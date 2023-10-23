class ExpenseCategory < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :expense_transactions
  
    # Attributes
    attribute :name, :string
    attribute :icon, :string
  
    # Validations
    validates :name, presence: true, length: { maximum: 255 }
    validates :icon, presence: true
end

class AddUserReferenceToExpenseCategories < ActiveRecord::Migration[7.0]
    def change
      add_reference :expense_categories, :author, null: false, foreign_key: { to_table: :users }
    end
  end

class ExpenseTransaction < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :expense_category
  
    # Attributes
    attribute :name, :string
    attribute :amount, :float
  
    # Validations
    validates :name, presence: true, length: { maximum: 250 }
    validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

class AddReferencesToExpenseTransactions < ActiveRecord::Migration[7.0]
    def change
      add_reference :expense_transactions, :author, null: false, foreign_key: { to_table: :users }
      add_reference :expense_transactions, :expense_category, null: false, foreign_key: true
    end
  end
  
