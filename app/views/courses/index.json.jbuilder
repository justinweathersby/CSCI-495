json.array!(@courses) do |course|
  json.extract! course, :id, :number, :school, :title, :hours
  json.url course_url(course, format: :json)
end
