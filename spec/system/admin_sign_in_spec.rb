# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Admin sign in process", type: :system do
  before do
    @admin = create :admin
  end

  it "sign in with valid credentials" do
    visit '/admins/sign_in'
    within("#new_admin") do
      fill_in 'admin_email', with: @admin.email
      fill_in 'admin_password', with: @admin.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_link 'Log Out'
  end

  it "sign in with invalid password" do
    visit '/admins/sign_in'
    within("#new_admin") do
      fill_in 'admin_email', with: @admin.email
      fill_in 'admin_password', with: "12333"
    end
    click_button 'Log in'
    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_no_link 'Log Out'
  end

  it "invalid with unregistered account" do
    fill_in "admin_email", with: Faker::Internet.email
    fill_in "admin_password", with: "Test1234"
    click_button "sign in"

    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_no_link 'Log Out'
  end
end
