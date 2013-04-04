class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :product_id
      t.string :content
      t.string :nickname

      t.timestamps
    end
  end
end
