class CreateUserFeatureFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :user_feature_flags do |t|
      t.belongs_to :feature_flag, foreign_key: true, null: false
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end

    add_index :user_feature_flags, [:feature_flag_id, :user_id], unique: true
  end
end


