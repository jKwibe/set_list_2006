require 'rails_helper'

RSpec.describe Artist do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :songs}
  end
  describe 'methods' do
    it "#average_song_length" do
      carly_rae = Artist.create(name: "Carly Rae")
      bon_jovi = Artist.create(name: "Bon Jovi")
      song_1 = Song.create(title: "I Really Like You", length: 100, play_count: 10000000, artist_id: carly_rae.id)
      song_2 = Song.create(title: "Livin on a Prayer", length: 200, play_count: 10000000, artist_id: bon_jovi.id)
      song_3 = carly_rae.songs.create(title: "Call Me Maybe", length: 300, play_count: 10000000)
      song_4 = carly_rae.songs.create(title: "asdf", length: 500, play_count: 10000000)

      expect(carly_rae.average_song_length).to eq(300)
      expect(bon_jovi.average_song_length).to eq(200)

    end
  end
end

# three main things we're testing
# - relationships ---
# - validations ---
# - class/instance methods
