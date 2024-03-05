json.extract! transaction, :id, :payee_id, :payer_id, :amount_in_pennies, :reference, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
