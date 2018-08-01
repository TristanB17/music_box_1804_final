require 'rails_helper'

describe Song, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:title)}
    it{should validate_presence_of(:length)}
    it{should validate_presence_of(:play_count)}
    it{should validate_presence_of(:rating)}
    it{should validate_numericality_of(:rating).is_greater_than_or_equal_to(0)}
    it{should validate_numericality_of(:rating).is_less_than_or_equal_to(5)}
  end

  describe 'relationships' do
    it{should belong_to(:artist)}
    it{should have_many(:song_genres)}
    it{should have_many(:genres).through(:song_genres)}
  end

  describe 'class methods' do
    it '#finds all songs by same rating' do
      artist = Artist.create(name: 'some guy')
      song_1 = Song.create(title: 'Muh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      song_2 = Song.create(title: 'Suh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      song_3 = Song.create(title: 'Wuh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      song_4 = Song.create(title: 'Buh', length: 4, play_count: 78, artist_id: 1, rating: 5)
      genre_1 = Genre.create(name: 'Ya like jazz?')
      genre_2 = Genre.create(name: 'Speed Metal')
      genre_3 = Genre.create(name: 'Theatre')
      song_genre_1 = SongGenre.create(song_id: 1, genre_id: 1)
      song_genre_4 = SongGenre.create(song_id: 1, genre_id: 2)
      song_genre_2 = SongGenre.create(song_id: 2, genre_id: 1)
      song_genre_3 = SongGenre.create(song_id: 3, genre_id: 2)

      expect(Song.find_by_rating(song_1).length).to eq(3)
    end
  end
end
