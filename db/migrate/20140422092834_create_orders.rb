class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

    	t.string   :first_name
	    t.string   :last_name
	    t.string   :email
	    t.string   :address_1
	    t.string   :address_2
	    t.string   :city
	    t.string   :postal_code
	    t.string   :country_code
	    t.date     :shipped_date
	    t.integer  :total_price
	    t.boolean  :shipped,      default: false
	    t.boolean  :cancel,       default: false
	    t.date     :cancel_date

    	t.timestamps
    end
  end
end
