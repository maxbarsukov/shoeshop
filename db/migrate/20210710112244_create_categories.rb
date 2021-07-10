class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :bytitle
      t.string :keywords
      t.string :description
      t.timestamps
    end
  end
end
