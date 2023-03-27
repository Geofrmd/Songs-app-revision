class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to song_path(@song)
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path, status: :see_other
  end

  private

  def song_params
    params.require(:song).permit(:title, :year, :category)
  end
end
