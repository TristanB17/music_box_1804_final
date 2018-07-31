require 'rails_helper'

describe 'a user' do
  describe 'visits a song show page' do
    it 'sees rating for a song' do
      artist = Artist.create(name: 'some guy')
      song = Song.create(title: 'Muh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      song_2 = Song.create(title: 'Suh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      song_3 = Song.create(title: 'Wuh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      genre_1 = Genre.create(name: 'Ya like jazz?')
      genre_2 = Genre.create(name: 'Speed Metal')
      song_genre_1 = SongGenre.create(song_id: 1, genre_id: 1)
      song_genre_1 = SongGenre.create(song_id: 2, genre_id: 1)
      song_genre_1 = SongGenre.create(song_id: 3, genre_id: 2)

      visit song_path(song)

      expect(page).to have_content(song.rating)
    end
    it 'sees all genres this song is part of' do
      artist = Artist.create(name: 'some guy')
      song_1 = Song.create(title: 'Muh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      song_2 = Song.create(title: 'Suh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      song_3 = Song.create(title: 'Wuh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      genre_1 = Genre.create(name: 'Ya like jazz?')
      genre_2 = Genre.create(name: 'Speed Metal')
      genre_3 = Genre.create(name: 'Theatre')
      song_genre_1 = SongGenre.create(song_id: 1, genre_id: 1)
      song_genre_4 = SongGenre.create(song_id: 1, genre_id: 2)
      song_genre_2 = SongGenre.create(song_id: 2, genre_id: 1)
      song_genre_3 = SongGenre.create(song_id: 3, genre_id: 2)

      visit song_path(song_1)

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
      expect(page).to_not have_content(genre_3.name)
    end
  end
end
