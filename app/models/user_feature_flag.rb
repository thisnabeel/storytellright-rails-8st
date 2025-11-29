class UserFeatureFlag < ActiveRecord::Base
  belongs_to :feature_flag
  belongs_to :user

  validates :feature_flag_id, uniqueness: { scope: :user_id }
end

