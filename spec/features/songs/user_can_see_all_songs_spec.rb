require "rails_helper"

RSpec.describe "songs index page", type: :feature do
  it "allows the user to see all song titles and play count" do
    song_1 = Song.create(title: "I Really Like You", length: 208, play_count: 10000000)
    song_2 = Song.create(title: "Call Me Maybe", length: 199, play_count: 10000000)

    visit "/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")

    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end
end
