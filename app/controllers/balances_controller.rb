class BalancesController < ApplicationController
  before_action :set_balance, only: %i[ show ]

  # GET /balances/1 or /balances/1.json
  def show
  end

  # POST /balances or /balances.json
  def create
    @balance = Balance.new(balance_params)

    respond_to do |format|
      if @balance.save
        format.html { redirect_to balance_url(@balance), notice: "Balance was successfully created." }
        format.json { render :show, status: :created, location: @balance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @balance.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_balance
      @balance = Balance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def balance_params
      params.require(:balance).permit(:user_id, :amount_in_pennies)
    end
end
