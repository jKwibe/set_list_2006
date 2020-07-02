require 'rails_helper'

RSpec.describe "Creating a new Song" do
  it "should create a new song for an artist" do
    Artist.create!(name: "Prince")
    Artist.create!(name: "Nickelback")
    artist = Artist.create!(name: "Bone Thugz n' Harmony")

    visit "/artists/#{artist.id}/songs/new"

    title = "First of the Month"
    length = 350
    play_count = 7689823

    expect(page).to have_content("Title:")
    fill_in :title, with: title
    fill_in :length, with: length
    fill_in :play_count, with: play_count

    click_button "Create Song"

    new_song = Song.last

    expect(current_path).to eq("/songs/#{new_song.id}")
    expect(page).to have_content(title)
    expect(page).to have_content(length)
    expect(page).to have_content(play_count)
  end
end
