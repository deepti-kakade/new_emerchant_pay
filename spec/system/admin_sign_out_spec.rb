# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Admin sign out process", type: :system do
  # before :each do
  #   User.create(name: "Admin", email: 'user@example.com', password: 'password', type: 'Admin')
  # end
  let!(:admin) { create(:user, type: 'Admin') }

  it "sign in with valid credentials" do
    sign_in(admin)
    visit root_path
    click_link 'Log Out'

    expect(page).to have_text 'Signed out successfully.'
    expect(page).to have_no_link 'Log Out'
    expect(page).to have_current_path root_path
  end
end
