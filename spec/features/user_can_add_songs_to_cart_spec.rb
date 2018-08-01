require 'rails_helper'

describe 'When a user adds a song to their cart' do
  it 'should show a correct increment for copies of same song' do
    artist = Artist.create(name: 'Bieber')
    song = artist.songs.create(title: 'this is the song that never ends...', length: 135, play_count: 0)

    visit songs_path

    click_button 'Add Song'

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")

    click_button 'Add Song'

    expect(page).to have_content("You now have 2 copies of #{song.title} in your cart.")
  end
  it 'should show cart total quantity' do
    artist = Artist.create(name: 'Bieber')
    song = artist.songs.create(title: 'this is the song that never ends...', length: 135, play_count: 0)

    visit songs_path

    expect(page).to have_content('Cart: 0')

    click_button 'Add Song'

    expect(page).to have_content('Cart: 1')
  end
end
