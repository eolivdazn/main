#require_relative '../matchers'

class ProcessPuppyPage
	include PageObject
	include RSpec::Matchers
	#include Matchers

	#button(:process , value =>"Process Puppy")

		def process_first_puppy
			button_element(:value => 'Process Puppy').click
		end

end