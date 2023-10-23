class ExpenseTransactionsController < ApplicationController
  before_action :set_expense_transaction, only: %i[ show edit update destroy ]

  # GET /expense_transactions or /expense_transactions.json
  def index
    @expense_transactions = ExpenseTransaction.all
  end

  # GET /expense_transactions/1 or /expense_transactions/1.json
  def show
  end

  # GET /expense_transactions/new
  def new
    @expense_transaction = ExpenseTransaction.new
  end

  # GET /expense_transactions/1/edit
  def edit
  end

  # POST /expense_transactions or /expense_transactions.json
  def create
    @expense_transaction = ExpenseTransaction.new(expense_transaction_params)

    respond_to do |format|
      if @expense_transaction.save
        format.html { redirect_to expense_transaction_url(@expense_transaction), notice: "Expense transaction was successfully created." }
        format.json { render :show, status: :created, location: @expense_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_transactions/1 or /expense_transactions/1.json
  def update
    respond_to do |format|
      if @expense_transaction.update(expense_transaction_params)
        format.html { redirect_to expense_transaction_url(@expense_transaction), notice: "Expense transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @expense_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_transactions/1 or /expense_transactions/1.json
  def destroy
    @expense_transaction.destroy

    respond_to do |format|
      format.html { redirect_to expense_transactions_url, notice: "Expense transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_transaction
      @expense_transaction = ExpenseTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_transaction_params
      params.require(:expense_transaction).permit(:name, :amount, :user_id, :group_id)
    end
end
