class HomePage
	include PageObject
	PUPPY_LOOKUP = {
					'Brook' => 0,
					'Hanna' => 1
					}
	page_url FigNewton.base_url
	#page_url "http://puppies.herokuapp.com"				

	def select_puppy(name = "Brook")
		index = puppy_index_for(name)
		button_element(:value => 'View Details', :index => index).click
	end

	private

	def puppy_index_for(name)
		PUPPY_LOOKUP[name]
	end

end