json.array!(@friends) do |friend|
  json.extract! friend, :id, :name, :contact, :catchup_period
  json.url friend_url(friend, format: :json)
end
