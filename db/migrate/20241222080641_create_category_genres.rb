class CreateCategoryGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :category_genres do |t|

      t.timestamps
    end
  end
end
