Feature: Adopting puppies

As a puppy lover
I want to adopt puppies
So they can chew my furniture

Background:
Given I am on the puppy adoption site



#Scenario: Verify message when adoption is processed
#Given I have a pending adoption for "Tom Jones"
#When I process that adoption
#Then I should see "Please thank"

#Scenario: Thank you message should be displayed
#When I complete the adoption of a puppy

Scenario: Thank you message should be displayed
When I checkout leaving the " " field blank
#Then I should see "Thank you for adopting a puppy!"