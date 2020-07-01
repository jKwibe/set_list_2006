require 'rails_helper'

RSpec.describe 'When I visit the artists index page' do
  it "I can destroy an artist" do
    carly_rae = Artist.create(name: "Carly Rae")
    britney = Artist.create(name: "Britney Spears")
    journey = Artist.create(name: "Journey")

    visit '/artists'

    expect(page).to have_content('Britney Spears')

    click_button "Delete Britney Spears"

    expect(current_path).to eq('/artists')
    expect(page).to_not have_content('Britney Spears')
  end
end
