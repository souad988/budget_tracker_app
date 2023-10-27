require 'rails_helper'

RSpec.describe ExpenseTransactionsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/expense_transactions/new').to route_to('expense_transactions#new')
    end

    it 'routes to #create' do
      expect(post: '/expense_transactions').to route_to('expense_transactions#create')
    end
  end
end
