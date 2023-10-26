class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_transactions

  # Attributes
  attribute :name, :string
  attribute :icon, :string

  # Validations
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :icon, presence: true
end
