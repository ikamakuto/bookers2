class CreateProfileImages < ActiveRecord::Migration[5.2]
  def change
    drop_table :profile_image
  end
end
