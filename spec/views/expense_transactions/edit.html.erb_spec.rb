require 'rails_helper'

RSpec.describe "expense_transactions/edit", type: :view do
  before(:each) do
    @expense_transaction = assign(:expense_transaction, ExpenseTransaction.create!(
      name: "MyString",
      amount: 1.5,
      user: nil,
      group: nil
    ))
  end

  it "renders the edit expense_transaction form" do
    render

    assert_select "form[action=?][method=?]", expense_transaction_path(@expense_transaction), "post" do

      assert_select "input[name=?]", "expense_transaction[name]"

      assert_select "input[name=?]", "expense_transaction[amount]"

      assert_select "input[name=?]", "expense_transaction[user_id]"

      assert_select "input[name=?]", "expense_transaction[group_id]"
    end
  end
end
