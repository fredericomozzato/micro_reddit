require "rails_helper"

describe "User visits the new account page" do
  it "and creates a new account successfully" do
    visit root_path
    within("#navbar") do
      click_on "Log in"
    end
    click_on "Sign up"
    fill_in "Username", with: "user_1"
    fill_in "Email", with: "user@email.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on "Sign up"

    expect(User.all.count).to eq 1
    expect(User.first.username).to eq "user_1"
    expect(User.first.email).to eq "user@email.com"
    within("#navbar") do
      expect(page).to have_content "user_1"
      expect(page).to have_button "Log out"
      expect(page).not_to have_content "Log in"
    end
  end

  it "and can't sign up without required fields" do
    visit new_user_registration_path
    click_on "Sign up"

    expect(page).to have_field "Username"
    expect(page).to have_field "Email"
    expect(page).to have_field "Password"
    expect(page).to have_field "Password confirmation"
    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end
end
