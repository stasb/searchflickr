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
    expect(page).to have_css('div.image-tile', count: 20)
  end

  scenario 'Complete a search from an existing results page' do
    visit root_path
    fill_in 'search', with: 'tokyo'
    click_button 'Search'
    expect(page).to have_content('Search results for "tokyo"')
    fill_in 'search', with: 'moscow'
    click_button 'Search'
    expect(page).to have_content('Search results for "moscow"')
    expect(page).to have_css('div.image-tile', count: 20)
  end

  scenario 'Complete a blank search from the home page' do
    visit root_path
    click_button 'Search'
    expect(page).to have_content('Showing the most recent images')
    expect(page).to have_css('div.image-tile', count: 20)
  end

  scenario 'Complete a blank search from an existing results page' do
    visit root_path
    fill_in 'search', with: 'tokyo'
    click_button 'Search'
    expect(page).to have_content('Search results for "tokyo"')
    click_button 'Search'
    expect(page).to have_content('Showing the most recent images')
    expect(page).to have_css('div.image-tile', count: 20)
  end
end
