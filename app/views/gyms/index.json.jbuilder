json.array!(@gyms) do |gym|
  json.extract! gym, :id, :name
  json.url gym_url(gym, format: :json)
end
