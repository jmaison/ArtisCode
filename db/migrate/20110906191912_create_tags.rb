class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :data
      t.string :url

      t.timestamps
    end
  end
end
