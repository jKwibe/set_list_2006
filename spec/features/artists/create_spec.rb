
require 'rails_helper'

RSpec.describe 'Create a new artist' do
  describe 'when I visit the artists index page' do
    it "I can follow a link to create a new artist " do
      visit '/artists'

      expect(page).to_not have_content("Journey")

      click_on 'New Artist'

      expect(current_path).to eq('/artists/new')

      fill_in :name, with: "Journey"

      click_on 'Create Artist'

      expect(current_path).to eq('/artists')
      expect(page).to have_content("Journey")
    end
  end
end
