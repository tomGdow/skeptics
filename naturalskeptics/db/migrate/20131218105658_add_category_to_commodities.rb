class AddCategoryToCommodities < ActiveRecord::Migration
  def change
    add_column :commodities, :category, :string
  end
end
