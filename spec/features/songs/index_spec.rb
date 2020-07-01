require "rails_helper"

RSpec.describe "songs index page", type: :feature do
  it "allows the user to see all song titles and play count" do
    carly_rae = Artist.create(name: "Carly Rae")
    bon_jovi = Artist.create(name: "Bon Jovi")
    britney = Artist.create(name: "Britney Spears")
    song_1 = Song.create(title: "I Really Like You", length: 208, play_count: 10000000, artist_id: carly_rae.id)
    song_2 = Song.create(title: "Livin on a Prayer", length: 208, play_count: 10000000, artist_id: bon_jovi.id)
    song_3 = carly_rae.songs.create(title: "Call Me Maybe", length: 199, play_count: 10000000)
    song_4 = britney.songs.create(title: "Toxic", length: 199, play_count: 10000000)
    song_5 = britney.songs.create(title: "Crazy", length: 199, play_count: 10000000)

    visit "/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")

    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end
  it "shows the average length of all songs" do
    carly_rae = Artist.create(name: "Carly Rae")
    bon_jovi = Artist.create(name: "Bon Jovi")
    song_1 = Song.create(title: "I Really Like You", length: 100, play_count: 10000000, artist_id: carly_rae.id)
    song_2 = Song.create(title: "Livin on a Prayer", length: 200, play_count: 10000000, artist_id: bon_jovi.id)
    song_3 = carly_rae.songs.create(title: "Call Me Maybe", length: 300, play_count: 10000000)

    visit "/songs"

    expect(page).to have_content("Average Length of Songs: 200")
  end
end
