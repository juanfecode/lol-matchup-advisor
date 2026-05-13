class ChampionSearchesController < ApplicationController
  def new
  end

  def create
    @query = params[:query]
    @results = ChampionSearchService.search(@query)
    
    respond_to do |format|
      format.turbo_stream
    end
  end
end
