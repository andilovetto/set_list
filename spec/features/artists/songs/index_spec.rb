require "rails_helper"

RSpec.describe 'artists songs index' do
  before :each do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: "Purple Rain", length: 665, play_count: 890)
    @beret = @prince.songs.create!(title: "Raspberry Beret", length: 543, play_count: 8990)
    @prince_song = @prince.songs.create!(title: "some prince song", length: 1, play_count: 8990)
  end

  it 'shows all of the titles of the song for the artist' do
    
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end


  it 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title 

    expect(current_path).to eq("/songs/#{@purple.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@prince.id}/songs"
    save_and_open_page
    expect(page).to have_content("Average Song Length for Prince: 403.0") 
  end
end