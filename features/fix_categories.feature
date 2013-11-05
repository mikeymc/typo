Feature: Create or edit Categories
  As a blog administrator
  In order to increase the breadth of my blog
  I want to be able to create or edit categories
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
  Scenario: Get into the Create or Edit Categories Page
    Given I am on the admin content page
    When I follow "Categories"
    Then I should be on the admin categories page
    And I should see "Categories"
    
  Scenario: Create a new Category
    Given I am on the admin categories page
    When I fill in "Name" with "Cat1"
    And I fill in "Description" with "My first category"
    And I press "Save"
    Then I should be on the admin categories page
    And I should see "Cat1"
    
  Scenario:  Edit an existing Category
    Given I am on the admin categories page
    When I fill in "Name" with "Cat1"
    And I fill in "Description" with "My first category"
    And I press "Save"
    Then I should be on the admin categories page
    And I should see "Cat1"
    When I follow "Cat1"
    Then I should be on the edit category page for "Cat1"
    And I should see "My first category"
    When I fill in "Description" with "Abracadabra"
    And I press "Save"
    Then I should be on the admin categories page
    And I should see "Cat1"
    When I follow "Cat1"
    Then I should be on the edit category page for "Cat1"
    And I should see "Abracadabra"
    
    
