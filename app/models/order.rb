class Order < ActiveRecord::Base

	has_many :order_products
	has_many :products, through: :order_products

	attr_accessor :card_number, :security_code, :card_expires_on



	


	def credit_card

		@credit_card ||= ActiveMerchant::Billing::CreditCard.new(
			:first_name				=> first_name,
			:last_name				=> last_name,
			:card_number			=> card_number,
			:verification_value		=> security_code,
			:month					=> card_expires_on.month,
			:year					=> card_expires_on.year
			)
	end



	def purchase

		response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
	
	end


	def purchase_options
		{
		:currency => USD
		}

	end







end
