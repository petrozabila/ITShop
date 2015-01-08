class UserMailer < ApplicationMailer

	default :from => "petrozabila@gmail.com"

	def order_confirmation(order)
		mail(:to => order.email, :subject => "Your order accepted")
	end
end
