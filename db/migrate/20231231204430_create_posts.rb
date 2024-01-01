class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :title, null: false, index: { unique: true, name: "unique_titles" }
      t.string :body, null: false

      t.timestamps
    end
  end
end
