class CreateSuggestables < ActiveRecord::Migration
  def self.up
    create_table :suggestables do |t|
      t.integer :suggested_by_id
      t.string :suggested_by_type
      t.integer :suggestion_id
      t.string :suggestion_type
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :suggestables
  end
end
