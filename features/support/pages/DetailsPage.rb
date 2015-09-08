class DetailsPage
	include PageObject


	button(:add_to_cart, :value=>'Adopt Me!')

	def add_to_cart
		add_to_cart_element.when_present.click
	end

end
