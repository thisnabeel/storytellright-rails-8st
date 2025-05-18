json.extract! positive_trait, :id, :title, :details, :created_at, :updated_at
json.neg_list positive_trait.neg_list
json.url positive_trait_url(positive_trait, format: :json)
