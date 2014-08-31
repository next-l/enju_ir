json.array!(@resources) do |resource|
  json.extract! resource, :id, :title, :date_of_publication
  json.url resource_url(resource, format: :json)
end
