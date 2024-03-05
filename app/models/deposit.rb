class Deposit < ApplicationRecord
  validates :amount_in_pennies, numericality: { greater_than: 0 }
end
