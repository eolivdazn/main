class ShoppingCartPage
	include PageObject

	NAME_COLUMN = 1
	SUBTOTAL_COLUMN = 3
	LINES_PER_PUPPY = 6
	
	button(:proceed_to_checkout,  :value => "Complete the Adoption")
	button(:continue_adopting,    :value => "Adopt Another Puppy")
	table(:cart,                  :index => 0)
	cell(:cart_total,             :class => "total_cell")
	div(:div_collar,              :css  =>  '#collar')

	def additional_products(arg="collar")
		if arg == "collar"
			div_collar_element.when_present.click
		end
	end

	def proceed_to_checkout
		additional_products 
		proceed_to_checkout_element.when_visible.click
	end

	def name_for_line_item(line_item)
		cart_line_item(line_item)[NAME_COLUMN].text
	end

	def subtotal_for_line_item(line_item)
		cart_line_item(line_item)[SUBTOTAL_COLUMN].text
	end					
	
	#### Helpers ####
	private

	def row_for(line_item)
		(line_item - 1) * LINES_PER_PUPPY
	end
	
	def cart_line_item(line_item)
		cart_element[row_for(line_item)]
	end

	def validate_total
		
	end
end
