Feature: add a class

  As a student
  So that I can create my schedule
  I want to add and remove classes from my schedule


Background: courses in schedule

  Given the following courses are in a schedule:
  | courseID    | semester | reqID | taken     |


  Then 4 seed courses should exist

Scenario: add director to existing movie
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Ridley Scott"

Scenario: find movie with same director
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"

Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Alien"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should see "'Alien' has no director info"
  And  I should be on the home page


Scenario: create a movie
  Given I am on the new movie page
  And I fill in "Title" with "New Movie"
  And I press "Save Changes"
  Then I should see "New Movie was successfully created."
  And I should be on the home page


Scenario: destroy a movie
  Given I am on the details page for "Alien"
  Then I follow "Delete"






Features:

1) adding classes
2) search courses
3) search requirements
__
4) create a profile

