class PagesController < ApplicationController
	def home
		@posts = Blog.all
		@languages = Language.all
	end

	def about; end

	def contact; end
end
