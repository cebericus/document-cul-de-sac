class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :filename
      t.string :content_type
      t.binary :binary_content, :limit => 16777214
      t.string :owner, :default => 'admin'
      t.string :description
      t.timestamps
    end
  end
end
