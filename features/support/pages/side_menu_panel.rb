module SideMenuPanel
	include PageObject

	link(:adoptions, :text => 'Adoptions') 
	link(:puppies, 	 :text => 'Adopt a Puppy')
	link(:learn,   	 :text => 'Learn')
	link(:logout,  	 :text => 'Logout')
	div(:navlist,    :css => ".sb_content")
		

	def click_link
		adoptions_element.when_visible.click
	end
end
