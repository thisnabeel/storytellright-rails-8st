json.extract! task, :id, :production_id, :user_id, :assigned_id, :note, :created_at, :updated_at
json.url task_url(task, format: :json)
