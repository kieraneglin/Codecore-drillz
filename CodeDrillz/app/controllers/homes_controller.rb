class HomesController < ApplicationController

	def index
		@drill = Drill.all
	end

	def show
	end

	

end
