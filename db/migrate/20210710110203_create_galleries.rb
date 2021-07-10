class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|

      t.timestamps
    end
  end
end
