class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups or /groups.json
  def index
    authenticate_user!
    @user = current_user
    @groups = @user.groups.includes(:expense_transactions).order('created_at DESC')

    # Initialize total amount of all transactions
    @global_expense_amount = 0.0
    # Loop through each expense category and collect its transactions amount
    @groups.each do |group|
      @global_expense_amount += group.expense_transactions.sum(:amount)
    end
  end

  # GET /groups/1 or /groups/1.json
  def show
    authenticate_user!
    @group = Group.find(params[:id])
    @expense_transactions = @group.expense_transactions.order('created_at DESC')
    @total_amount = @group.expense_transactions.sum(&:amount).round(2)
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    authenticate_user!
    @group = Group.new(group_params)
    @group.author = current_user
    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
