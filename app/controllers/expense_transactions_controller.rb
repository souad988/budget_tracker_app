class ExpenseTransactionsController < ApplicationController
  before_action :set_expense_transaction, only: %i[show edit update destroy]

  # GET /expense_transactions or /expense_transactions.json
  def index
    @expense_transactions = ExpenseTransaction.all
  end

  # GET /expense_transactions/1 or /expense_transactions/1.json
  def show; end

  # GET /expense_transactions/new
  def new
    @expense_transaction = ExpenseTransaction.new
    @groups = current_user.groups
  end

  # GET /expense_transactions/1/edit
  def edit; end

  # POST /expense_transactions or /expense_transactions.json
  def create
    @group = Group.find(expense_transaction_params[:group_id])
    expense_transaction_params.delete(:group_id)
    p('espense_transaction_params',expense_transaction_params) 
    @expense_transaction = ExpenseTransaction.new(expense_transaction_params.except(:group_id))
    @expense_transaction.author = current_user
    @expense_transaction.groups << @group
    respond_to do |format|
      if @expense_transaction.save
        format.html do
          redirect_to group_url(@group),
                      notice: 'Expense transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @expense_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_transactions/1 or /expense_transactions/1.json
  def update
    @group = Group.find(expense_transaction_params[:group_id])
    respond_to do |format|
      if @expense_transaction.update(expense_transaction_params)
        format.html do
          redirect_to group_url(@group),
                      notice: 'Expense transaction was successfully updated.'
        end
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
      format.html { redirect_to expense_transactions_url, notice: 'Expense transaction was successfully destroyed.' }
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
