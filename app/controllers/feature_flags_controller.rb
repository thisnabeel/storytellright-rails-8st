class FeatureFlagsController < ApplicationController
  before_action :authenticate_user!

  # Check if a feature flag is enabled for the current user
  def check
    title = params[:title]
    user_id = current_user&.id

    enabled = FeatureFlag.enabled?(title, user_id)
    
    render json: { enabled: enabled }
  end

  # Enable a feature flag for the current user
  def enable
    title = params[:title]
    user_id = current_user&.id

    if title.present? && user_id.present?
      FeatureFlag.enable(title, user_id)
      render json: { success: true, message: "Feature flag '#{title}' enabled for user" }
    else
      render json: { success: false, error: "Title and user_id are required" }, status: :unprocessable_entity
    end
  end

  # Disable a feature flag for the current user
  def disable
    title = params[:title]
    user_id = current_user&.id

    if title.present? && user_id.present?
      FeatureFlag.disable(title, user_id)
      render json: { success: true, message: "Feature flag '#{title}' disabled for user" }
    else
      render json: { success: false, error: "Title and user_id are required" }, status: :unprocessable_entity
    end
  end
end


