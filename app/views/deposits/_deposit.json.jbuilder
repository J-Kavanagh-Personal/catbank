json.extract! deposit, :id, :payee_id, :amount_in_pennies, :created_at, :updated_at
json.url balance_deposit_url(deposit, format: :json)
