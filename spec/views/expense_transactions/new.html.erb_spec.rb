require 'rails_helper'

RSpec.describe "expense_transactions/new", type: :view do
  before(:each) do
    assign(:expense_transaction, ExpenseTransaction.new(
      name: "MyString",
      amount: 1.5,
      user: nil,
      group: nil
    ))
  end

  it "renders new expense_transaction form" do
    render

    assert_select "form[action=?][method=?]", expense_transactions_path, "post" do

      assert_select "input[name=?]", "expense_transaction[name]"

      assert_select "input[name=?]", "expense_transaction[amount]"

      assert_select "input[name=?]", "expense_transaction[user_id]"

      assert_select "input[name=?]", "expense_transaction[group_id]"
    end
  end
end
