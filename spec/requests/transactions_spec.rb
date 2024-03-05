# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions' do

  let(:user) { create(:user) }
  let(:user_2) { create(:user) }
  let(:balance) { create(:balance, user_id: user.id) }
  let(:balance_2) { create(:balance, user_id: user_2.id) }
  let(:transaction) { create(:transaction) }

  before do
    balance
    balance_2
    transaction
  end

  it "get /balances/?/transactions" do
    get "/balances/#{balance.id}/transactions"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
  end

  it "get /balances/?/transactions/?" do
    get "/balances/#{balance.id}/transactions/#{transaction.id}"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:show)
  end

  it "get /balances/?/transactions/new" do
    sign_in user
    get "/balances/#{balance.id}/transactions/new"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:new)
  end

  it "post /balances/?/transactions" do
    post balance_transactions_path(balance_id: balance.id), params: { transaction: { payee_id: user_2.id,
                                                                                    payer_id: user.id,
                                                                                    amount_in_pennies: 100,
                                                                                    reference: "test"
                                                                                  } }
    expect(response).to have_http_status(:found)
    expect(response).to redirect_to(balance_transactions_url)
  end
end
