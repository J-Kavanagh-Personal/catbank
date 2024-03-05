class PaymentJob
  include Sidekiq::Job

  def perform(payee_id, payer_id, amount_in_pennies, reference)
    payee_balance = Balance.find_by(user_id: payee_id)
    payer_balance = Balance.find_by(user_id: payer_id)
    out_transaction = Transaction.create(payee_id: payee_id,
                                      payer_id: payer_id,
                                      amount_in_pennies: -amount_in_pennies,
                                      reference: reference)
    in_transaction = Transaction.create(payee_id: payer_id,
                                     payer_id: payee_id,
                                     amount_in_pennies: amount_in_pennies,
                                     reference: reference)
    payee_balance.amount_in_pennies += in_transaction.amount_in_pennies
    payer_balance.amount_in_pennies += out_transaction.amount_in_pennies
    payee_balance.save
    payer_balance.save
  end
end
