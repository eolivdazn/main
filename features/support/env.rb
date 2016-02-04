require 'rspec'
require 'page-object'
require 'faker'
require 'data_magic'
require 'require_all'
require 'fig_newton'
require 'capybara'
require 'selenium/webdriver'

#Dir[File.dirname(__FILE__) + '/../libs/**/*.rb'].each {|file| require file } # require all libs from corelib
#FigNewton.load('heroku.yml') -> move to cucumber


require_all File.dirname(__FILE__) + "/pages"

PageObject::PageFactory.routes = {
:default => [[HomePage, :select_puppy],
			[DetailsPage, :add_to_cart],
			[ShoppingCartPage, :proceed_to_checkout],
			[CheckoutPage, :checkout]],
								 }


World(PageObject::PageFactory)



