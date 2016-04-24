require 'rails_helper'

RSpec.feature 'home page content', :type => :feature do
	background { visit root_path }

	  scenario "should have welcome text" do
	    expect(page).to have_text('Welcome. The form below')
	  end

	  scenario "should not have any error messages" do
	    expect(page).not_to have_text("You searched for")
	  end

	  scenario 'valid App Store ID' do
	  	fill_in "search_appID", with: 284910350
	  	click_button "Search!"
	  	expect(page).to have_text('searched the Apple App Store for the app with ID 284910350')
	  	expect(page).to have_text('artistId')
	  	expect(page).to have_text('trackCensoredName')
	  	expect(page).to have_text('sellerName')
	  	expect(page).to have_text('version')
	  	expect(page).to have_text('releaseNotes')
	  	expect(page).to have_text('currentVersionReleaseDate')
	  end

	  scenario 'invalid App Store ID' do
	  	fill_in "search_appID", with: 1
	  	click_button "Search!"
	  	expect(page).to have_text('You searched for 1')
	  	expect(page).to have_text('We could not find this app on the Apple App Store')
	  end

	  scenario 'valid Google Play Store ID' do
	  	fill_in "search_appID", with: 'com.facebook.katana'
	  	click_button "Search!"
	  	expect(page).to have_text('searched the Google Play Store for the app with ID com.facebook.katana')
	  	expect(page).to have_text('app_id')
	  	expect(page).to have_text('title')
	  	expect(page).to have_text('developer')
	  	expect(page).to have_text('current_version')
	  	expect(page).to have_text('whats_new')
	  	expect(page).to have_text('updated')
	  end

	  scenario 'invalid App Store ID' do
	  	fill_in "search_appID",    with: 'lskdjf'
	  	click_button "Search!"
	  	expect(page).to have_text('We could not find this app on the Google Play Store')
	  end

end
