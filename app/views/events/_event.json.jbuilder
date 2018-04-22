json.extract! event, :id, :title, :date, :venue, :min_member, :max_member, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
