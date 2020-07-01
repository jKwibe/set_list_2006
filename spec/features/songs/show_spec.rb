require 'rails_helper'

RSpec.describe 'Songs show page' do
  it "shows all title,playcount, length, and artist name for a particular song" do
    carly_rae = Artist.create(name: "Carly Rae")
    song_1 = Song.create(title: "I Really Like You", length: 208, play_count: 10000000, artist_id: carly_rae.id)
    song_2 = carly_rae.songs.create(title: "Call Me Maybe", length: 199, play_count: 10000000)

    visit "/songs/#{song_1.id}"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Length: #{song_1.length}")
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content("Artist: #{carly_rae.name}")
    expect(page).to_not have_content(song_2.title)

  end
end
