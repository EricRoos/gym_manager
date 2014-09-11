json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :member_id, :balance, :workouts, :workouts_used
  json.url transaction_url(transaction, format: :json)
end
