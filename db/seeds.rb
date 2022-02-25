require "open-uri"
require "json"
List.destroy_all
Bookmark.destroy_all
Movie.destroy_all

3.times do |page|
  api_response = JSON.parse(URI.open("http://tmdb.lewagon.com/movie/top_rated?page=#{page+1}").read)

  api_response['results'].each do |result|
    Movie.create!(title: result['title'], overview: result['overview'], poster_url: "https://image.tmdb.org/t/p/original/#{result['backdrop_path']}", rating: result['vote_average'])
  end
end

5.times do
  List.create!(name: Faker::Movie.title)
end
