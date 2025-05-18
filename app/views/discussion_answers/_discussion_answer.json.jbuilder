json.extract! discussion_answer, :id, :body, :user_id, :discussion_question_id, :created_at, :updated_at
json.url discussion_answer_url(discussion_answer, format: :json)
