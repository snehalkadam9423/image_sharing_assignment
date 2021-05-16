class HomeController < ApplicationController
	def index
		@photos = Photo.order(created_at: :asc).last(25)
	end
end
