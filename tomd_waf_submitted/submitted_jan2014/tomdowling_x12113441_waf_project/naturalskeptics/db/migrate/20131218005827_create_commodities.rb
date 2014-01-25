class CreateCommodities < ActiveRecord::Migration
  def change
    create_table :commodities do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :image_url

      t.timestamps
    end
  end
end
