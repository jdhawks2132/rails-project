class PortfoliosController < ApplicationController
	before_action :set_portfolio, only: %i[show edit update destroy]

	def index
		@portfolio_items = Portfolio.all
	end

	def show; end

	def new
		@portfolio = Portfolio.new
	end

	# POST /blogs or /blogs.json
	def create
		@portfolio = Portfolio.new(portfolio_params)

		respond_to do |format|
			if @portfolio.save
				format.html do
					redirect_to @portfolio, notice: 'portfolio was successfully created.'
				end
				format.json { render :show, status: :created, location: @portfolio }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json do
					render json: @portfolio.errors, status: :unprocessable_entity
				end
			end
		end
	end

	private

	# Use callbacks to share common setup or constraints between actions.
	def set_portfolio
		@portfolio = Portfolio.find(params[:id])
	end

	# Only allow a list of trusted parameters through.
	def portfolio_params
		params.require(:portfolio).permit(:title, :subititle, :description)
	end
end
