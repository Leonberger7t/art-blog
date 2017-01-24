
json.array!(@posts) do |post|
  json.extract! post, :id, :title, :release_year, :price, :description, :imdb_id, :poster_url
  json.url movie_url(post, format: :json)
end
