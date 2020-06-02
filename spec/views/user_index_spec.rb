require 'rails_helper'

RSpec.describe 'Welcome to Private Events', type: :system do
  context "While visiting the home page as a new user" do
    it "page contains 'Welcome to Private Events'" do
      visit root_path
      expect(page).to have_content('Welcome to Private Events')
    end
  end
end