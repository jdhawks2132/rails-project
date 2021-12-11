class PortfoliosController < ApplicationController
	before_action :set_portfolio, only: %i[show edit update destroy]

	def index
		@portfolio_items = Portfolio.all
	end

	def show; end

	def new
		@portfolio_item = Portfolio.new
	end

	# POST /blogs or /blogs.json
	def create
		@portfolio_item = Portfolio.new(portfolio_params)

		respond_to do |format|
			if @portfolio_item.save
				format.html do
					redirect_to portfolios_path,
					            notice: 'portfolio was successfully created.'
				end
				format.json do
					render :show, status: :created, location: @portfolio_item
				end
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json do
					render json: @portfolio_item.errors, status: :unprocessable_entity
				end
			end
		end
	end

	def edit
		@portfolio_item = Portfolio.find(params[:id])
	end

	def update
    @portfolio_item = Portfolio.find(params[:id])

		respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
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
		params.require(:portfolio).permit(:title, :subtitle, :body)
	end
end
