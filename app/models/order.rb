class Order < ActiveRecord::Base

	has_many :order_items, dependent: :destroy
	

	has_many :products

	validates :name, :address, :email, presence: true


	#private

	  #def update_total
	   # self.total = products.present? ? products.collect { |p| p.subtotal_price }.sum : 0
	  #end
end
