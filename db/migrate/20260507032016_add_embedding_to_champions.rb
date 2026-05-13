class AddEmbeddingToChampions < ActiveRecord::Migration[7.2]
  def change
    enable_extension :vector
    add_column :champions, :embedding, :vector, limit: 1024
  end
end

