class CreateFatModelsMaterializedView < ActiveRecord::Migration[7.1]
  def up
    # Because materialized views are always explicitly refreshed,
    # "now()" is not "right now" but the time of that refresh
    execute <<-SQL
      CREATE MATERIALIZED VIEW fat_models_json_agg AS
      SELECT jsonb_agg(jsonb_build_object('name', indexed_attribute_1)) AS name_agg,
             NOW() AS last_refreshed_at
      FROM fat_models;
    SQL
  end

  def down
    execute <<-SQL
      DROP MATERIALIZED VIEW fat_models_json_agg;
    SQL
  end
end
