require 'rails_helper'

RSpec.describe 'Artists Index Page' do
  it "shows all of the artists names" do
    carly_rae = Artist.create(name: "Carly Rae")
    britney = Artist.create(name: "Britney Spears")
    journey = Artist.create(name: "Journey")

    visit '/artists'

    expect(page).to have_content(carly_rae.name)
    expect(page).to have_content(britney.name)
    expect(page).to have_content(journey.name)
  end
end




# I see a list of all artist names
