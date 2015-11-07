json.array!(@completes) do |complete|
  json.extract! complete, :id
  json.url complete_url(complete, format: :json)
end
