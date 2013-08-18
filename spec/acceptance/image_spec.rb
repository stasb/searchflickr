require 'acceptance/acceptance_helper'

feature 'Image Search', %q{
  In order to use the Search Flickr app
  As a user
  I want to search for and view relevant images
} do

  scenario 'Complete a search from the home page' do
    visit root_path
    fill_in 'search', with: 'tokyo'
    click_button 'Search'
    expect(page).to have_content('Search results for "tokyo"')
  end

  scenario 'Complete a search from an existing results page' do
    visit root_path
    fill_in 'search', with: 'tokyo'
    click_button 'Search'
    expect(page).to have_content('Search results for "tokyo"')
    fill_in 'search', with: 'moscow'
    click_button 'Search'
    expect(page).to have_content('Search results for "moscow"')
  end

  scenario 'Complete a blank search from the home page' do
    visit root_path
    click_button 'Search'
    expect(page).to have_content('Showing the most recent images')
  end

  scenario 'Complete a blank search from an existing results page' do
    visit root_path
    fill_in 'search', with: 'tokyo'
    click_button 'Search'
    expect(page).to have_content('Search results for "tokyo"')
    click_button 'Search'
    expect(page).to have_content('Showing the most recent images')
  end
end
