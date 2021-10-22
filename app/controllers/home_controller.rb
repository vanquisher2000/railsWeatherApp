class HomeController < ApplicationController
  def index
    
    @search_logs = SearchLog.all

  end
end
