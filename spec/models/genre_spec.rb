require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it {should have_many(:song_genres)}
    it {should have_many(:songs).through(:song_genres)}
  end

  describe 'instance methods' do
    it 'calculates average rating of all songs in genre' do
      artist = Artist.create(name: 'some guy')
      song_1 = Song.create(title: 'Muh', length: 4, play_count: 78, artist_id: 1, rating: 3)
      song_2 = Song.create(title: 'Suh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      genre = Genre.create(name: 'Ya like jazz?')
      song_genre_1 = SongGenre.create(song_id: 1, genre_id: 1)
      song_genre_2 = SongGenre.create(song_id: 2, genre_id: 1)
      expected_number = 4

      expect(genre.average_song_rating).to eq(4)
    end
    it 'finds song with highest rating' do
      artist = Artist.create(name: 'some guy')
      song_1 = Song.create(title: 'Muh', length: 4, play_count: 78, artist_id: 1, rating: 3)
      song_2 = Song.create(title: 'Suh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      genre = Genre.create(name: 'Ya like jazz?')
      song_genre_1 = SongGenre.create(song_id: 1, genre_id: 1)
      song_genre_2 = SongGenre.create(song_id: 2, genre_id: 1)

      expect(genre.highest_rated_song).to eq(song_2)
    end
    it 'finds song with lowest rating' do
      artist = Artist.create(name: 'some guy')
      song_1 = Song.create(title: 'Muh', length: 4, play_count: 78, artist_id: 1, rating: 3)
      song_2 = Song.create(title: 'Suh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      genre = Genre.create(name: 'Ya like jazz?')
      song_genre_1 = SongGenre.create(song_id: 1, genre_id: 1)
      song_genre_2 = SongGenre.create(song_id: 2, genre_id: 1)

      expect(genre.lowest_rated_song).to eq(song_1)
    end
  end
end
