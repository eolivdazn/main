#require 'watir-webdriver'
require 'capybara/cucumber'
require 'selenium-webdriver'

Before do
	## seeting multiple browser --dont forget chrome.exec in the folder
	case ENV['BROWSER']
	  when 'ff', 'Firefox'
	    @browser = Selenium::WebDriver.for :firefox
	  when 'chrome'
	  	chromedriver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)),"browsers","chromedriver.exe")
	  	Selenium::WebDriver::Chrome.driver_path = chromedriver_path
	    @browser = Selenium::WebDriver.for :chrome
	  else
	   @browser = Selenium::WebDriver.for :firefox
	 end
	@browser.manage.window.maximize
end


After do |scenario|
	 if scenario.failed? #take pic save , embed in report
	 	print path = @browser.current_url
  	@browser.save_screenshot "pic.png"
  	embed "pic.png" ,'report/png'
  	end
  	@browser.close
end


