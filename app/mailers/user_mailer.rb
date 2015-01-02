class UserMailer < ApplicationMailer

	default :from => "petrozabila@gmail.com"

	def order_confirmation(order)
		@name = @order.name
		mail(:to => order.email, :subject => "Your order accepted")
	end
end
