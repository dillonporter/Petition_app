class HomeController < ApplicationController
  def index
    @petitions = Petition.most_popular.limit(3)
  end
end
