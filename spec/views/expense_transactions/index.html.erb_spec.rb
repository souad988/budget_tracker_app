require 'rails_helper'

RSpec.describe 'expense_transactions/index', type: :view do
  before(:each) do
    assign(:expense_transactions, [
             ExpenseTransaction.create!(
               name: 'Name',
               amount: 2.5,
               user: nil,
               group: nil
             ),
             ExpenseTransaction.create!(
               name: 'Name',
               amount: 2.5,
               user: nil,
               group: nil
             )
           ])
  end

  it 'renders a list of expense_transactions' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.5.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
