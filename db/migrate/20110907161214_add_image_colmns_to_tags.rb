class AddImageColmnsToTags < ActiveRecord::Migration
  def change
    add_column :tags, :image_file_name, :string
    add_column :tags, :image_content_type, :string
    add_column :tags, :image_file_size, :integer
    add_column :tags, :image_updated_at, :datetime
  end
end
