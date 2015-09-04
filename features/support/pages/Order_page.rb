class OrderPage
	include PageObject
	include RSpec::Matchers

	button(:process , :value =>"Process Puppy")
	link(  :next,     :css=>".next_page")
	div(   :msg ,      :css=>"#notice")

		def available_puppys
			process_element.visible?
		end

		def next_page
			next_element.when_visible.click
		end

		def validate_msg arg
			wait_until do msg_element.visible? end
			print msg
			expect msg_element.text.should include arg
		end

end