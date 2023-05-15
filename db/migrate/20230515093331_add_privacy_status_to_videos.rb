class AddPrivacyStatusToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :privacy_status, :string
  end
end
