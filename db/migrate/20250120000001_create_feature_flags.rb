class CreateFeatureFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_flags do |t|
      t.string :title, null: false, index: { unique: true }

      t.timestamps
    end
  end
end

