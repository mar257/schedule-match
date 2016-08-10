require 'rails_helper'

RSpec.feature "A person can login", type: :feature do
  let(:password) { 'test_pass' }
  let(:user) { FactoryGirl.create(:user, password: password) }

  scenario "A person can login" do
    visit new_session_path
    fill_in "username", with: user.username
    fill_in "password", with: password
    click_button "Login"
    expect(current_path).to eq user_path(user)
  end

  scenario "A person inputs a bad login" do
  end
end
