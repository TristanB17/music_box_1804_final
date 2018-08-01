require 'rails_helper'

describe 'a user' do
  describe 'visits a genre show page' do
    it 'sees all genres' do
      artist = Artist.create(name: 'some guy')
      song_1 = Song.create(title: 'Muh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      song_2 = Song.create(title: 'Suh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      song_3 = Song.create(title: 'Wuh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      genre_1 = Genre.create(name: 'Ya like jazz?')
      genre_2 = Genre.create(name: 'Speed Metal')
      song_genre_1 = SongGenre.create(song_id: 1, genre_id: 1)
      song_genre_2 = SongGenre.create(song_id: 2, genre_id: 1)
      song_genre_3 = SongGenre.create(song_id: 3, genre_id: 2)

      visit genres_path

      click_on genre_1.name

      expect(current_path).to eq(genre_path(genre_1))
      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_2.title)
      expect(page).to_not have_content(song_3.title)
    end
    it 'sees average rating of all songs in genre' do
      artist = Artist.create(name: 'some guy')
      song_1 = Song.create(title: 'Muh', length: 4, play_count: 78, artist_id: 1, rating: 3)
      song_2 = Song.create(title: 'Suh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      song_3 = Song.create(title: 'Wuh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      genre = Genre.create(name: 'Ya like jazz?')
      song_genre_1 = SongGenre.create(song_id: 1, genre_id: 1)
      song_genre_2 = SongGenre.create(song_id: 2, genre_id: 1)
      song_genre_3 = SongGenre.create(song_id: 3, genre_id: 2)
      expected_number = 4

      visit genre_path(genre)

      expect(page).to have_content("Average rating: #{expected_number}")
      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_2.title)
      expect(page).to_not have_content(song_3.title)
    end
    it 'sees song in genre with highest rating' do
      artist = Artist.create(name: 'some guy')
      song_1 = Song.create(title: 'Muh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      song_2 = Song.create(title: 'Suh', length: 4, play_count: 78, artist_id: 1, rating: 3)
      song_3 = Song.create(title: 'Wuh', length: 4, play_count: 78, artist_id: 1, rating: 1)
      genre = Genre.create(name: 'Ya like jazz?')
      song_genre_1 = SongGenre.create(song_id: 1, genre_id: 1)
      song_genre_2 = SongGenre.create(song_id: 2, genre_id: 1)
      song_genre_3 = SongGenre.create(song_id: 3, genre_id: 1)

      visit genre_path(genre)

      expect(page).to have_content("Highest song rating for #{genre.name}: #{song_1.title}, #{song_1.rating}")
      expect(page).to have_content("Lowest song rating for #{genre.name}: #{song_3.title}, #{song_3.rating}")
    end
  end
end
