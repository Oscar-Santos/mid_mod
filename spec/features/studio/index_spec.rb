require 'rails_helper'

RSpec.describe 'studio index page' do
  it 'displays each studios name and location' do
    studio = Studio.create(name: "Universal Studios", location: "Hollywood")
    movie_1  = studio.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    movie_2  = studio.movies.create(title: 'Indiana Jones', creation_year: 1989, genre: 'Action/sci_fi')

    actor_1 = Actor.create(name: 'Harrison Ford', age: 78)
    actor_2 = Actor.create(name: 'Tom Cruise', age: 59)


    MovieActor.create(movie_id: movie_1.id, actor_id: actor_1.id)
    MovieActor.create(movie_id: movie_2.id, actor_id: actor_2.id)

    visit '/studios'
    expect(page).to have_content(studio.name)
    expect(page).to have_content(studio.location)
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_2.title)
    #save_and_open_page
  end
end
