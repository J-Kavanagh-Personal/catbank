# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/balances', type: :request do
  let(:balance) { create(:balance) }
  let(:user) { create(:user) }


  it "get /balances/?" do
    get "/balances/#{balance.id}"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:show)
  end

  it "post /balances" do
    post balances_path, params: { balance: { user_id: user.id, amount_in_pennies: 100 } }
    expect(response).to have_http_status(:found)
    expect(response).to redirect_to(balance_url(id: Balance.last.id))
  end
end
