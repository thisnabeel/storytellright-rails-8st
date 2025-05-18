json.extract! discussion_question, :id, :body, :position, :discussion_id, :created_at, :updated_at
json.url discussion_question_url(discussion_question, format: :json)
