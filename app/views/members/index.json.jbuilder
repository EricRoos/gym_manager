json.array!(@members) do |member|
  json.extract! member, :id, :name, :email, :gym_id
  json.url member_url(member, format: :json)
end
