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
end
