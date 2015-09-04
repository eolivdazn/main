module ErrorPanel
	include PageObject
	
## elements ####
	unordered_list(:error_list) do |page|
		page.error_div_element.unordered_list_element
	end
	### Methods ###
	def error_messages
		error_list_element.text
	end
end