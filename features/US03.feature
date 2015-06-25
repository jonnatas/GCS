@selenium
Feature: US03
  As a user
  I want to compare two classes
  So i can assess both performance

  Scenario:
  	Given Im on the compare page
    When I click on the Button Compare
    Then I should see a ideb ranking
    Then I should see a rate evasion graph
    Then I should see a performance graph
    Then I should see a distortion graph

  Scenario:
    Given Im on the compare page
    Then I should see a Initial Year field
    Then I should see a State field
    Then I should see a Grade field

  Scenario:
    Given Im on the compare page
    When I click on the select field
    Then I should see a font field
    Then I should see a local field
    Then I should see a network field

