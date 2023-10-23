require 'rails_helper'

RSpec.describe "expense_transactions/show", type: :view do
  before(:each) do
    @expense_transaction = assign(:expense_transaction, ExpenseTransaction.create!(
      name: "Name",
      amount: 2.5,
      user: nil,
      group: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
