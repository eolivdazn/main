require_relative 'error_panel'
class CheckoutPage
	include PageObject
	include DataMagic
	include ErrorPanel

	###############elements###########
	text_field(:name, :id => "order_name")
	text_field(:address, :id => "order_address")
	text_field(:email, :id => "order_email")
	select_list(:pay_type, :id => "order_pay_type")
	button(:place_order, :value => "Place Order")
	div(:error_div, :id => 'error_explanation')

	########### Methods #################
	#Load YML
	DataMagic.load('data.yml')

	#DEFAULT_DATA = {
	#			'name' => 'cheezy',
	#			'address' => '123 Main Street',
	#			'email' => 'cheezy@example.com',
	#			'pay_type' => 'Purchase order'
	#				}

	def checkout(data = {})
		#populate_page_with DEFAULT_DATA.merge(data)
		populate_page_with data_for(:checkout_page, data)
		place_order	
	end



	#def name(name)
	#	name.set(name)
	#end
	#
	#def address(address)
	#	address.set(address)
	#end
	#
	#def email(email)
	#	email.set(email)
	#end
#
#	#def pay_type(pay_with)
#	#	pay_type.select(pay_with)
#	#end
#
#	#def place_order
#	#	place_order.click
	#end
end
