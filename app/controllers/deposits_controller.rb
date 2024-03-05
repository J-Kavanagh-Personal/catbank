class DepositsController < ApplicationController
  before_action :set_deposit, only: %i[ show ]

  # GET /deposits or /deposits.json
  def index
    @deposits = Deposit.where(payee_id: current_user)
  end

  # GET /deposits/1 or /deposits/1.json
  def show
  end

  # GET /deposits/new
  def new
    @deposit = Deposit.new
  end

  # POST /deposits or /deposits.json
  def create
    @deposit = Deposit.new(deposit_params)
    @balance = Balance.find(params[:balance_id])

    respond_to do |format|
      if @deposit.save
        @balance.amount_in_pennies += @deposit.amount_in_pennies.to_i
        @balance.save
        format.html { redirect_to balance_deposit_url(id: @deposit.id), notice: "Deposit was successfully created." }
        format.json { render :show, status: :created, location: @deposit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deposit
      @deposit = Deposit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deposit_params
      params.require(:deposit).permit(:payee_id, :amount_in_pennies)
    end
end
