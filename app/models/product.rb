class Product < ActiveRecord::Base

	has_many :order_products
	has_many :orders, through: :order_products


	has_attached_file :image, styles: {large: "480x480#", medium: "240x240#", small: "120x120#"}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
