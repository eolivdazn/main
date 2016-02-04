#require 'watir-webdriver'
require 'capybara/cucumber'
require 'selenium-webdriver'

url = "http://#{ENV['username']}:#{ENV['key']}@hub.browserstack.com/wd/hub"

	capabilities = Selenium::WebDriver::Remote::Capabilities.new
	capabilities['os'] = ENV['OS']
	capabilities['os_version'] = ENV['OS_VERSION']
	capabilities['browser'] = ENV['BROWSER']
	capabilities['browser_version'] = ENV['BROWSER_VERSION']

	browser = Selenium::WebDriver.for(:remote,
									  								:url => url,
  	                                :desired_capabilities => capabilities)


Before do |scenario|
  @browser = browser
end

After do |scenario|
	 if scenario.failed? #take pic save , embed in report
	 	print path = @browser.current_url

    os_path = ENV['OS'].gsub(" ","")
		browser_path = ENV['BROWSER'].gsub(" ","")

  		@browser.save_screenshot("report/#{os_path}/#{browser_path}/#{scenario.__id__}.png")
    	embed("report/#{os_path}/#{browser_path}/#{scenario.__id__}.png", "image/png", "SCREENSHOT")
  	end
  	@browser.close
end



	 	
