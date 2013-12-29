class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.text :introduction
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
