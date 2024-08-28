class AddIndexedColumn < ActiveRecord::Migration[7.1]
  def change
    change_table :fat_models do |t|
      t.string :indexed_attribute_1
      t.index :indexed_attribute_1
    end

    update <<~SQL
      UPDATE fat_models
      SET indexed_attribute_1 = attribute_1
    SQL
  end
end
