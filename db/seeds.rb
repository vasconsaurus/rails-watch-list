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

2.times do
  api_response = URI.open("http://unsplash.it/1200/600/?random")

  list = List.new(name: Faker::Movie.title)
  list.photo.attach(io: api_response, filename: 'nes.png', content_type: 'image/png')
  list.save!
end
