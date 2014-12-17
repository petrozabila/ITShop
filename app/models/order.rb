class Order < ActiveRecord::Base
	has_many :products

	validates :name, :address, :email, presence: true
end
