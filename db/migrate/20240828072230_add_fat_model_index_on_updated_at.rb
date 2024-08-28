class AddFatModelIndexOnUpdatedAt < ActiveRecord::Migration[7.1]
  def change
    add_index :fat_models, :updated_at
  end
end
