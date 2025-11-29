class FeatureFlag < ActiveRecord::Base
  has_many :user_feature_flags, dependent: :destroy
  has_many :users, through: :user_feature_flags

  validates :title, presence: true, uniqueness: true

  # Enable a feature flag for a specific user
  def self.enable(title, user_id)
    feature_flag = find_or_create_by(title: title.to_s)
    user = User.find_by(id: user_id)
    return nil unless user
    
    unless feature_flag.users.include?(user)
      feature_flag.users << user
    end
    
    feature_flag
  end

  # Disable a feature flag for a specific user
  def self.disable(title, user_id)
    feature_flag = find_by(title: title.to_s)
    return nil unless feature_flag
    
    user = User.find_by(id: user_id)
    return nil unless user
    
    feature_flag.users.delete(user)
    feature_flag
  end

  # Check if a feature flag is enabled for a user
  def self.enabled?(title, user_id)
    return false unless user_id.present?
    
    feature_flag = find_by(title: title.to_s)
    return false unless feature_flag
    
    user = User.find_by(id: user_id)
    return false unless user
    
    feature_flag.users.include?(user)
  end
end

