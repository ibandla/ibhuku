class Execute < ActiveRecord::Base
	require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

# ID of the payment. This ID is provided when creating payment.
payment_id = ENV["PAYMENT_ID"] || "PAY-83Y70608H1071210EKES5UNA"
@payment = Payment.find(payment_id)

# PayerID is required to approve the payment.
if @payment.execute( :payer_id => ENV["PAYER_ID"] || "DUFRQ8GWYMJXC" )  # return true or false
  logger.info "Payment[#{@payment.id}] execute successfully"
else
  logger.error @payment.error.inspect
end
end
