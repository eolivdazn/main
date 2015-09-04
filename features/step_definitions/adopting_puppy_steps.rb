Given(/^I am on the puppy adoption site$/) do
  visit_page(HomePage)
  fail unless @browser.current_url.should include "http://puppies.herokuapp.com" 
end



#When(/^I click the View Details button for "([^"]*)"$/) do |name|
#   on_page(HomePage).select_puppy name
#end

####### Details #################
#When(/^I click the Adopt Me button$/) do
#  on_page(DetailsPage).add_to_cart
#end

#######_ShoppingCartPage_#########

#When(/^I click the Complete the Adoption button$/) do
# on_page(ShoppingCartPage).proceeed_to_checkout    
#end
#When(/^I click the Adopt Another Puppy button$/) do
#  on_page(ShoppingCartPage).continue_adopting
#end

### Validation ###

Then (/^I should see "([^"]*)" as the name for line item (\d+)$/) do |name, line_item|
  on_page(ShoppingCartPage).name_for_line_item(line_item.to_i).should include name
end

Then(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |subtotal, line_item|
  on_page(ShoppingCartPage).subtotal_for_line_item(line_item.to_i).should == subtotal
end

Then(/^I should see "([^"]*)" as the cart total$/) do |total|
  on_page(ShoppingCartPage).cart_total == total
end

###########checkout############
#When(/^I enter "([^"]*)" in the name field$/) do  |name|
#  on_page(CheckoutPage).name=(name)
#end
#
#When(/^I enter "([^"]*)" in the address field$/) do |address|
#  on_page(CheckoutPage).address=(address)
#end
#
#When(/^I enter "([^"]*)" in the email field$/) do |email|
#  on_page(CheckoutPage).email=(email)
#end
#
#When(/^I select "([^"]*)" from the pay with dropdown$/) do |pay_type|
#  on_page(CheckoutPage).pay_type=(pay_type)
#end
#
#When(/^I click the Place Order button$/) do
#  on_page(CheckoutPage).place_order
#end

Then(/^I should see "([^"]*)"$/) do |msg|
 #@current_page.error_messages.should include msg
 #@current_page.should have_error_message msg
 fail (print "No adotpion") unless on_page(OrderPage).validate_msg msg
end

#### other senario ###########3
#When (/^I complete the adoption with:$/) do |table|
#    data = table.hashes.first
#    on_page(CheckoutPage) do |page|
#    page.name = data['name']
#    page.address = data['address']
#    page.email = data['email']
#    page.pay_type = data['pay_type']
#    page.place_order
#  end
#end
When (/^I complete the adoption of a puppy$/) do
  navigate_to(CheckoutPage).checkout
  #on_page(HomePage).select_puppy
  #on_page(DetailsPage).add_to_cart
  #on_page(ShoppingCartPage).proceed_to_checkout
  #on_page(CheckoutPage).checkout
end

When (/^I checkout leaving the "([^"]*)" field blank$/) do |opt|
  navigate_to(CheckoutPage).checkout('name' => '')
  #on_page(HomePage).select_puppy
  #on_page(DetailsPage).add_to_cart
  #on_page(ShoppingCartPage).proceed_to_checkout
  #on_page(CheckoutPage).checkout(opt => '')
end

Given (/^I have a pending adoption for "([^"]*)"$/) do |name|
  navigate_to(CheckoutPage).checkout('name' => name)
  #on_page(HomePage).select_puppy
  #on_page(DetailsPage).add_to_cart
  #on_page(ShoppingCartPage).proceed_to_checkout
  #on_page(CheckoutPage).checkout('name' => name)
end

When (/^I process that adoption$/) do
  visit_page(LandingPage)
  on_page(LoginPage).login_to_system
  on_page(LandingPage).click_link
  while !on_page(OrderPage).available_puppys
    on_page(OrderPage).next_page
  end
  on_page(ProcessPuppyPage).process_first_puppy
end


# TO USE WITH TABLE
#When (/^I complete the adoption with:$/) do |table|
#  on_page(CheckoutPage).checkout(table.hashes.first)
#end