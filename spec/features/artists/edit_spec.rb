require 'rails_helper'

RSpec.describe 'Artist Edit' do
  it "I can edit an artist info" do
    carly_rae = Artist.create(name: "Carly Rae")

    visit '/artists'

    expect(page).to_not have_content("Jepsen")

    click_on "Edit Carly Rae"

    expect(current_path).to eq("/artists/#{carly_rae.id}/edit")

    fill_in :name, with: "Carly Rae Jepsen"

    click_on 'Update Artist'

    expect(current_path).to eq('/artists')
    expect(page).to have_content("Carly Rae Jepsen")
  end
end






# Then I am redirected back to the artists index
# And I see the updated name
