json.array!(@messages) do |message|
  json.extract! message, :id, :message, :chatroom_id
  json.url message_url(message, format: :json)
end
