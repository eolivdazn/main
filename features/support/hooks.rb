#require 'watir-webdriver'
require 'capybara/cucumber'
require 'selenium-webdriver'

Before do
	## seeting multiple browser --dont forget chrome.exec in the folder
	case ENV['BROWSER']
	  when 'ff', 'Firefox'
	    @browser = Selenium::WebDriver.for :firefox
	  when 'chrome'
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
  	embed "pic.png" ,'image/png'
  	end
  	@browser.close
end











 #Capybara.rgister_driver :selenium do |app|
 #	browser = (ENV['browser'] || "firefox").to_sym
 #	Capybara::selenium::Driver.new(app, :browser=>browser)
 #end 