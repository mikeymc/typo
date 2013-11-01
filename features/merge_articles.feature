Feature: Merge Articles
  As an admin
  In order to blend two articles
  I want to merge articles

  Background:
    Given the blog is set up

  Scenario: Merge Two Articles as Admin    
    Given I am logged into the admin panel
    And I am on the new article page
    When I fill in "article_title" with "my first post"
    And I fill in "article__body_and_extended_editor" with "this is the song that never ends"
    And I press "Publish"
    And I go to the new article page
    When I fill in "article_title" with "my second post"
    And I fill in "article__body_and_extended_editor" with "yes it goes on and on my friends"
    And I press "Publish"
    When I follow "my first post"
    When I am on the edit page for "my first post"
    When I fill in "merge_with" with the article id of "my second post"
    And I press "Merge"
    Then I should be on the edit page for "my first post"
    Then I should see "this is the song that never ends"
    And I should see "yes it goes on and on my friends"   
    When I go to the admin content page
    And I should see "my first post"
    And I should not see "my second post"
    And the author for "my first post" should be "admin"
    
  Scenario: A non administrator should see the merge option
    Given I am logged in as a non administrator
    When I am on the new article page
    Then I should not see "Merge Article"
    
  Scenario: Merge an article with itself
    Given I am logged into the admin panel
    And I am on the new article page
    When I fill in "article_title" with "my first post"
    And I fill in "article__body_and_extended_editor" with "this is the song that never ends"
    And I press "Publish"
    And I go to the new article page
    When I fill in "article_title" with "my second post"
    And I fill in "article__body_and_extended_editor" with "yes it goes on and on my friends"
    And I press "Publish"
    When I follow "my first post"
    When I am on the edit page for "my first post"
    When I fill in "merge_with" with the article id of "my first post"
    And I press "Merge"
    Then I should be on the edit page for "my first post"
    And I should see "Error, you cannot merge an article with itself"
    
  Scenario: Merge an article with a non-existent article
    Given I am logged into the admin panel
    And I am on the new article page
    When I fill in "article_title" with "my first post"
    And I fill in "article__body_and_extended_editor" with "this is the song that never ends"
    And I press "Publish"
    And I go to the new article page
    When I fill in "article_title" with "my second post"
    And I fill in "article__body_and_extended_editor" with "yes it goes on and on my friends"
    And I press "Publish"
    When I follow "my first post"
    When I am on the edit page for "my first post"
    When I fill in "merge_with" with the article id of "my nonexistent post"
    And I press "Merge"
    Then I should be on the edit page for "my first post"
    And I should see "Error, that article does not exist"
    
  

