class FatModelMaterializedJson < ApplicationRecord
  self.table_name = 'fat_models_json_agg'

  def self.fetch_and_parse!
    refresh_in_db!
    first.name_agg
  end

  def self.fetch_as_string!
    refresh_in_db!
    ActiveRecord::Base.connection.execute("SELECT name_agg FROM fat_models_json_agg").first['name_agg']
  end

  # Option 1: check with Ruby if the view needs updating
  def self.refresh_manually!
    last_refresh = ActiveRecord::Base.connection.execute("SELECT last_refreshed_at FROM fat_models_json_agg").first['last_refreshed_at']
    if last_refresh < FatModel.maximum(:updated_at)
      ActiveRecord::Base.connection.execute("REFRESH MATERIALIZED VIEW fat_models_json_agg")
    end
  end

  # Option 2: Express the conditional refresh in PSQL
  def self.refresh_in_db!
    ActiveRecord::Base.connection.execute(<<~SQL)
      DO $$
      BEGIN
        IF (
          (SELECT last_refreshed_at FROM fat_models_json_agg LIMIT 1)
          < 
          (SELECT MAX(updated_at) FROM fat_models)
        ) THEN
          REFRESH MATERIALIZED VIEW fat_models_json_agg;
        END IF;
      END $$;
    SQL
  end

  # Option 3: Always refresh the view whenever the fat_models table changes
  #           Note that this can slow down write operations if the table is updated frequently,
  #           but could be finetuned to run in the background ("CONCURRENTLY")
  #
  # CREATE OR REPLACE FUNCTION refresh_fat_models_json_agg() RETURNS trigger AS $$
  # BEGIN
  #   PERFORM REFRESH MATERIALIZED VIEW fat_models_json_agg;
  #   RETURN NULL;
  # END;
  # $$ LANGUAGE plpgsql;
  #
  # CREATE TRIGGER refresh_materialized_view_after_change
  # AFTER INSERT OR UPDATE ON fat_models
  # FOR EACH STATEMENT
  # EXECUTE FUNCTION refresh_fat_models_json_agg();
end
