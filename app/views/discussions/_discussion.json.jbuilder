json.extract! discussion, :id, :title, :description, :questions, :answers, :members, :club_id, :unlock_time, :position, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
