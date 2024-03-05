# frozen_string_literal: true

require 'rails_helper'


RSpec.describe '/balances/?/deposits', type: :request do

  let(:user) { create(:user) }
  let(:balance) { create(:balance) }
  let(:deposit) { create(:deposit) }

  it "get /balances/?/deposits" do
    get "/balances/#{balance.id}/deposits"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
  end

  it "get /balances/?/deposits/?" do
    get "/balances/#{balance.id}/deposits/#{deposit.id}"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:show)
  end

  it "get /balances/?/deposits/new" do
    sign_in user
    get "/balances/#{balance.id}/deposits/new"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:new)
  end

  it "post /balances/?/deposits" do
    post balance_deposits_path(balance_id: balance.id), params: { deposit: { payee_id: user.id, amount_in_pennies: 100 } }
    expect(response).to have_http_status(:found)
    expect(response).to redirect_to(balance_deposit_url(balance_id: balance.id, id: Deposit.last.id))
  end
end
