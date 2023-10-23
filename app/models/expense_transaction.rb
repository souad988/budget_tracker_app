class ExpenseTransaction < ApplicationRecord
  belongs_to :author, class_name: 'User'
    belongs_to :group
  
    # Attributes
    attribute :name, :string
    attribute :amount, :float
  
    # Validations
    validates :name, presence: true, length: { maximum: 250 }
    validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
