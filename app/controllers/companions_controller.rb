class CompanionsController < ApplicationController
  def index
    @companions = Companion.all
  end
end
