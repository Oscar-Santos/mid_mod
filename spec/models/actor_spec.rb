require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe 'class methods' do
    it 'order actors by age' do
      actor_1 = Actor.create(name: 'Harrison Ford', age: 78)
      actor_2 = Actor.create(name: 'Tom Cruise', age: 59)

      expected = [actor_2, actor_1]
      expect(Actor.by_age).to eq(expected)
    end
  end
end
