class Order < ActiveRecord::Base

	has_many :order_products
	has_many :products, through: :order_products

	attr_accessor :card_number, :security_code, :card_expires_on

	# validate :validate_card, :on => :create

 #  def validate_card
 #    unless credit_card.valid?
 #      credit_card.errors.full_messages.each do |message|
 #        errors.add_to_base message
 #      end
 #    end
 #  end


	def purchase(basket)

		response = GATEWAY.purchase(Product.total_basket_price(basket)*100, credit_card)
	
	end

	def credit_card

		@credit_card ||= ActiveMerchant::Billing::CreditCard.new(
			:number					=> card_number,
			:first_name				=> first_name,
			:last_name				=> last_name,
			:verification_value		=> security_code,
			:month					=> card_expires_on.month,
			:year					=> card_expires_on.year
			)
	end




	

end
