class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy,:use_workout]
  before_action :set_gym_member

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end


  def use_workout
    @transaction.use_workout!
    @transaction.save
    redirect_to gym_member_path(@gym,@member)
  end
  # GET /transactions/1
  # GET /transactions/1.json
  def show
    
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @member = Member.find(params[:member_id])
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to gym_member_path(@gym,@member), notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to gym_member_path(@gym,@member), notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to gym_member_path(@gym,@member), notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
      
    end

    def set_gym_member
      @member = Member.includes(:gym).find(params[:member_id])
      @gym = @member.gym
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:member_id, :balance, :workouts, :workouts_used,:rate)
    end
end
