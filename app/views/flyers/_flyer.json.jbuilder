json.extract! flyer, :id, :event_date, :event_time, :address1, :address2, :created_at, :updated_at
json.url flyer_url(flyer, format: :json)