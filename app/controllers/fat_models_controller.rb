class FatModelsController < ApplicationController
  before_action(except: [:index]) do
    respond_to :json
  end

  def index
    respond_to :html

    render html:
     "<h1>Different attempts to render JSON<br><small>roughly sorted by rendering speed:</small></h1>".html_safe +
     %w[
      jbuilder
      render_json
      select_json
      indexed_json
      plucked
      db_live_computed
      parsed_materialized_view
      raw_materialized_view
    ].map {|action| "<a href='/fat_models/#{action}.json'>#{action}</a>" }
     .join("<br>\n")
     .html_safe
  end

  # todos
  # * add joined attribute
  # * add complex string transformation

  def render_json
    render json: FatModel.all.map { |fat_model|
      { name: fat_model.attribute_1 }
    }.to_json
  end

  def select_json
    render json: FatModel.all.select(:attribute_1).map { |fat_model|
      { name: fat_model.attribute_1 }
    }.to_json
  end

  def indexed_json
    render json: FatModel.all.select(:indexed_attribute_1).map { |fat_model|
      { name: fat_model.indexed_attribute_1 }
    }.to_json
  end

  def jbuilder
    @fat_models = FatModel.select(:indexed_attribute_1)
  end

  def plucked
    render json: FatModel.pluck(:indexed_attribute_1).map { |indexed_attribute_1|
      { name: indexed_attribute_1 }
    }.to_json
  end

  def db_live_computed
    result = ActiveRecord::Base.connection.execute(Arel.sql(<<-SQL))
      SELECT jsonb_agg(jsonb_build_object('name', indexed_attribute_1)) AS name_agg
      FROM fat_models;
    SQL
    render json: result.first['name_agg']
  end

  def parsed_materialized_view
    render json: FatModelMaterializedJson.fetch_and_parse!
  end

  def raw_materialized_view
    render json: FatModelMaterializedJson.fetch_as_string!
  end

end
