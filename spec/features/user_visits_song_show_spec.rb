require 'rails_helper'

describe 'a user' do
  describe 'visits a song show page' do
    it 'sees rating for a song' do
      artist = Artist.create(name: 'some guy')
      song = Song.create(title: 'Muh', length: 4, play_count: 78, artist_id: 1, rating: 5)

      visit song_path(song)

      expect(page).to have_content(song.rating)
    end
  end
end
