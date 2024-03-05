class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show ]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.where(payer_id: current_user)
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = PaymentJob.new.perform(transaction_params[:payee_id],
                                          transaction_params[:payer_id],
                                          transaction_params[:amount_in_pennies],
                                          transaction_params[:reference])

    respond_to do |format|
      format.html { redirect_to balance_transactions_url, notice: "Transaction was successfully created." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:payee_id, :payer_id, :amount_in_pennies, :reference)
    end
end
