class Balance < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :deposits
end
