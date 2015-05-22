json.array!(@tests) do |test|
  json.extract! test, :id, :body
  json.url test_url(test, format: :json)
end
