class CreateArticleCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :article_categories do |t|
      t.timestamps
      t.integer :article_id
      t.integer :category_id
    end
  end
end
