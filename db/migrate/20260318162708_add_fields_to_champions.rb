class AddFieldsToChampions < ActiveRecord::Migration[7.2]
  def change
    add_column :champions, :champion_id, :string
    add_column :champions, :title, :string
    add_column :champions, :image_url, :string
  end
end
