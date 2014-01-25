class AddCaptionToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :caption, :string
  end
end
