require 'rails_helper'

describe 'a user' do
  describe 'visits a genre index page' do
    it 'sees all genres' do
      user = User.create(username: 'Bobby', password: 'wow')
      genre_1 = Genre.create(name: 'Ya like jazz?')
      genre_2 = Genre.create(name: 'Speed Metal')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit genres_path

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
    end
  end
end
describe 'an admin' do
  describe 'sees a genre index page' do
    it 'can create a new genre' do
      admin = User.create(username: 'Bobby', password: 'cheese', role: 1)
      genre_1 = Genre.create(name: 'Ya like jazz?')
      genre_2 = Genre.create(name: 'Speed Metal')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      click_on 'Create Song'

      save_and_open_page

      expect(page).to have_field(:genre_name)

      fill_in :genre_name, with: 'Beebop'
      click_on 'Create Genre'

      expect(page).to have_content('Beebop')
    end
  end
end
