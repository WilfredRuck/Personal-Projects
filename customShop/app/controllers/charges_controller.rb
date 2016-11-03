class ChargesController < ApplicationController

	def home
		@products = Product.all
	end

	def new
	end

	def create

		#Amount in cents
		@amount = 50

		customer = Stripe::Customer.create(
			:email => params[:stripeEmail],
			:source => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer     => customer.id,
			:amount       => @amount,
			:description  => 'Donation to Admin',
			:currency     => 'usd'
		)

		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_charge_path
		end

	end

	def show
		raise params.inspect
  		@product = Product.find params[:id]
	end
		
	def index
	end