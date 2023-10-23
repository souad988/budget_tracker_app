require "rails_helper"

RSpec.describe ExpenseTransactionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/expense_transactions").to route_to("expense_transactions#index")
    end

    it "routes to #new" do
      expect(get: "/expense_transactions/new").to route_to("expense_transactions#new")
    end

    it "routes to #show" do
      expect(get: "/expense_transactions/1").to route_to("expense_transactions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/expense_transactions/1/edit").to route_to("expense_transactions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/expense_transactions").to route_to("expense_transactions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/expense_transactions/1").to route_to("expense_transactions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/expense_transactions/1").to route_to("expense_transactions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/expense_transactions/1").to route_to("expense_transactions#destroy", id: "1")
    end
  end
end
