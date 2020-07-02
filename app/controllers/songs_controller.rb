class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    # songs = Song.all
    # @song = songs.find do |song|
    #   song.title == params[:title]
    # end
  end

  def new
    @artist_id = params[:artist_id]
  end

  def create

    artist = Artist.find(params[:artist_id])
    new_song = artist.songs.create(song_params)
    redirect_to("/songs/#{new_song.id}")
  end

  private
  def song_params
    params.permit(:title, :length, :play_count)
  end
end
