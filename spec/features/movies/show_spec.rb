require 'rails_helper'

RSpec.describe 'movie show page' do
  it 'displays movies attributes' do
    studio = Studio.create(name: "Universal Studios", location: "Hollywood")
    movie_1  = studio.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    movie_2  = studio.movies.create(title: 'Indiana Jones', creation_year: 1989, genre: 'Action/sci_fi')

    actor_1 = Actor.create(name: 'Harrison Ford', age: 78)
    actor_2 = Actor.create(name: 'Tom Cruise', age: 59)

    MovieActor.create(movie_id: movie_1.id, actor_id: actor_1.id)
    MovieActor.create(movie_id: movie_2.id, actor_id: actor_2.id)

    visit "/movies/#{movie_1.id}"
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)
  end

  it 'displays all actors from youngest to oldest' do
    studio = Studio.create(name: "Universal Studios", location: "Hollywood")
    movie_1  = studio.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')

    actor_1 = Actor.create(name: 'Harrison Ford', age: 78)
    actor_2 = Actor.create(name: 'Tom Cruise', age: 59)

    MovieActor.create(movie_id: movie_1.id, actor_id: actor_1.id)
    MovieActor.create(movie_id: movie_1.id, actor_id: actor_2.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(actor_2.name)
    expect(page).to have_content(actor_1.name)
  end

  it 'displays average age of all of the movies actors.' do

    studio = Studio.create(name: "Universal Studios", location: "Hollywood")
    movie_1 = studio.movies.create(title: "Raiders of the lost ark", creation_year: 1981, genre: "Action")

    actor_1 = Actor.create(name: 'Harrison Ford', age: 78)
    actor_2 = Actor.create(name: 'Tom Cruise', age: 59)

    MovieActor.create(movie_id: movie_1.id, actor_id: actor_1.id)
    MovieActor.create(movie_id: movie_1.id, actor_id: actor_2.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content("Average age: #{movie_1.actor_average_age}")

  end

  
end
