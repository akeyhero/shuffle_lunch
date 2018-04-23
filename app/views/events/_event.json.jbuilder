json.extract! event, :id, :title, :date, :min_member, :max_member, :max_group_member, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
