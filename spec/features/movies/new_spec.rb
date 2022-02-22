require 'rails_helper'

RSpec.describe '' do
  it 'add an actor to the movie' do
    studio = Studio.create(name: "Universal Studios", location: "Hollywood")
    movie_1 = studio.movies.create(title: "Raiders of the lost ark", creation_year: 1981, genre: "Action")

    actor_1 = Actor.create(name: 'Harrison Ford', age: 78)
    actor_2 = Actor.create(name: 'Tom Cruise', age: 59)
    actor_3 = Actor.create(name: 'Jim Carrey', age: 64)

    MovieActor.create(movie_id: movie_1.id, actor_id: actor_1.id)
    MovieActor.create(movie_id: movie_1.id, actor_id: actor_2.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to_not have_content(actor_3.name)
    click_on('Add Actor')

    fill_in(:name, with: 'Tom')

    click_on('Submit')

    expect(current_path).to eq("/movies/#{movie_1.id}")
    expect(page).to have_content('Tom')
  end
end
