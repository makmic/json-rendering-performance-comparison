##
# Navigate to http://127.0.0.1:3000/ or use /bin/measure-endpoints for a time comparison measurement
class FatModelsController < ApplicationController
  before_action(except: [:index]) do
    respond_to :json
  end

  def index
    respond_to :html

    render html:
     "<h1>Different attempts to render JSON<br><small>roughly sorted by rendering speed:</small></h1>".html_safe +
       Constants::ACTIONS.map {|action| "<a href='/fat_models/#{action}.json'>#{action}</a>" }
     .join("<br>\n")
     .html_safe
  end

  def jbuilder_baseline
    @fat_models = FatModel.all
  end

  def jbuilder_select_attribute
    @fat_models = FatModel.select(:attribute_1)
  end

  def jbuilder_select_indexed_attribute
    @fat_models = FatModel.select(:indexed_attribute_1)
  end

  def without_jbuilder
    render json: FatModel.all.map do |fat_model|
      { name: fat_model.attribute_1 }
    end.to_json
  end

  def select_attribute
    render json: FatModel.all.select(:attribute_1).map do |fat_model|
      { name: fat_model.attribute_1 }
    end.to_json
  end

  def select_indexed_attribute
    render json: FatModel.all.select(:indexed_attribute_1).map do |fat_model|
      { name: fat_model.indexed_attribute_1 }
    end.to_json
  end

  def pluck_attribute
    render json: FatModel.pluck(:attribute_1).map do |attribute_1|
      { name: attribute_1 }
    end.to_json
  end

  def pluck_indexed_attribute
    render json: FatModel.pluck(:indexed_attribute_1).map do |indexed_attribute_1|
      { name: indexed_attribute_1 }
    end.to_json
  end

  def aggregate_in_postgres
    result = ActiveRecord::Base.connection.execute(Arel.sql(<<-SQL))
      SELECT jsonb_agg(jsonb_build_object('name', indexed_attribute_1)) AS name_agg
      FROM fat_models;
    SQL
    render json: result.first['name_agg']
  end

  def parse_materialized_view
    render json: FatModelMaterializedJson.fetch_and_parse!
  end

  def raw_materialized_view
    render json: FatModelMaterializedJson.fetch_as_string!
  end

end
