json.extract! company, :id, :title, :folder, :user_id, :created_at, :updated_at
json.members company.users
json.url company_url(company, format: :json)
