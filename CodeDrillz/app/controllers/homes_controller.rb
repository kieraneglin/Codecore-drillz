class HomesController < ApplicationController

  def index
    @drills = Drill.all
  end

end
