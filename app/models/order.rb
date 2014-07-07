class Order < ActiveRecord::Base

	has_many :order_products, dependent: :destroy
	has_many :products, through: :order_products


	attr_accessor :card_number, :security_code, :card_expires_on

	before_save :titleize
  	before_create :titleize

# scope for active admin
	scope :shipment_pending, -> { where(shipped: false, cancel: false) }
	scope :shipped, -> { where(shipped: true) }
	scope :cancelled, -> { where(cancel: true) }
	# scope :Purchase_complete, -> { where(cancel: false) }


	validates :first_name, presence: {:message => "Please enter your first name"}, length: { minimum: 2, :message => "Your name isn't long enough" }, :on => :create
	validates :last_name, presence: {:message => "Please enter your last name"}, length: { minimum: 2 }, :on => :create
	validates :email, presence: {:message => "Please enter a valid email address"}, format: { with: /.+@.+\..+/i}, :on => :create 
	validates :address_1, presence: {:message => "Please enter your address"}, :on => :create
	validates :city, presence: {:message => "Please enter your city"}, :on => :create
	validates :postal_code, presence: {:message => "Please enter your postal or zip code"}, :on => :create
	validates :country_code, presence: {:message => "Please select your country"}, :on => :create
	validates :card_number, presence: true, :on => :create
	validates :security_code, presence: true, length: { is: 3 }, :on => :create
	validates :card_expires_on, presence: true, :on => :create
	validates_absence_of :cancel, :message => "You cannot cancel an order that has shipped OR ship an order that has been cancelled!", :if => :shipped?

	# validate :validate_card, :on => :create
	validate :validate_options, :on => :create
	


# convert object to human readable format
	def to_s
  		"#{id}"	
  	end

# This is for the row on Active Admin that displays Order number and name
	def display_name
		a = self.id.to_s
		b = "Order ##{a}" + " - " + self.first_name + " " + self.last_name

	end

	def titleize
		self.first_name = self.first_name.titleize
		self.last_name = self.last_name.titleize
		self.address_1 = self.address_1.titleize
		self.address_2 = self.address_2.titleize
		self.city = self.city.titleize
		self.postal_code = self.postal_code.titleize
	end

	def shipped_date
		if self.shipped == true
			self.shipped_date = Time.now
		else
			
		end	
	end

	def cancel_date
		if self.cancel == true
			self.cancel_date = Time.now
		else

		
		end	
	end

	def total_order_cost
    	
    	self.products.collect{|item| item[:price]}.sum

  	end

	# def validate_card
	#  unless credit_card.valid? 
	#       credit_card.errors.full_messages.each do |message|
 #       	   errors[:base] << message

	#       end


	#    end

	# end

	def validate_options
		unless purchase_options.present? 
	      purchase_options.errors.full_messages.each do |message|
       	   errors[:base] << message

	      end
	    
	    end

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

	def purchase_options 
	{
		:billing_address => {
			:address1 => address_1,
			:address2 => address_2,
			:city 	  => city,
			:country  => country_code,
			:zip      => postal_code 
			}
	}

	end

	def purchase(basket)

		response = GATEWAY.purchase(Product.total_basket_price(basket)*100, credit_card, purchase_options)
		
			if response.params.key?('error')

				errors[:base] << response.message

				false

			else 

				true	
			end	

	end



end

