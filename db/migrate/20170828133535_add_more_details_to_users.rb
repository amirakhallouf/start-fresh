class AddMoreDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tag_line, :string
    add_column :users, :video_url, :string
  end
end
