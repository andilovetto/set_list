require 'rails_helper'

RSpec.describe 'the songs show page' do

  it 'displays the song title' do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2793)
    song_2 = artist.songs.create!(title: "Jam", length: 516, play_count: 1)
    visit "/songs/#{song.id}"

    expect(page).to_not have_content(song_2.title)
    expect(page).to have_content(song.title)
  end


  it 'displays the name of the artist for the song' do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2793)
    song_2 = artist.songs.create!(title: "Jam", length: 516, play_count: 1)
    
    visit "/songs/#{song.id}"
    expect(page).to have_content(artist.name)
  end

end