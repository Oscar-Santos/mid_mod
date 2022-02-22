require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe 'class methods' do
    it 'can find average age of actors ' do
      studio = Studio.create(name: "Universal Studios", location: "Hollywood")
      movie_1 = studio.movies.create(title: "Raiders of the lost ark", creation_year: 1981, genre: "Action")

      actor_1 = Actor.create(name: 'Harrison Ford', age: 78)
      actor_2 = Actor.create(name: 'Tom Cruise', age: 59)

      MovieActor.create(movie_id: movie_1.id, actor_id: actor_1.id)
      MovieActor.create(movie_id: movie_1.id, actor_id: actor_2.id)

      expect(movie_1.actor_average_age).to eq(68.5)
    end
  end
end





# movie_1 = Movie.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
# actor_1 = movie_1.actors.create(name: 'Harrison Ford', age: 78)
# actor_2 = movie_1.actors.create(name: 'Tom Cruise', age: 59)
#
# MovieActor.create(actor_id: actor_1.id, movie_id: movie_1.id)
# MovieActor.create(actor_id: actor_2.id, movie_id: movie_1.id)
