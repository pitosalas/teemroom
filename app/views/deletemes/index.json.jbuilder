json.array!(@deletemes) do |deleteme|
  json.extract! deleteme, :id, :a
  json.url deleteme_url(deleteme, format: :json)
end
