Feature: user login

  As a student
  I can log into my account
  I want to see that my account is how I left it


Background: user is logged out, logging back in

  Given the following students are in a Student table
  | id | uni     | email                | password| major1 | standing  |
  | 1  | sma2243 | sma2243@columbia.edu | test    | 1      | Fall 2023 |

  Given the following majors are in a Major table
  | major_minorID | name            | mtype |
  |1              | Computer Science| major |


Scenario: log in with correct email and password


Scenario: log in with incorrect email


Scenario: log in with incorrect password


Scenario: navigate to other pages while being logged in


Scenario: navigate to other pages while not being logged in


Scenario: logging out


Scenario: 









Scenario: add required course to existing schedule
  Given I am on the schedule page
  And I follow "Add Courses" on "Fall 2022"
  Then I should be on the Add Course page for "Fall 2022"
  And I press "add Fundamentals" on add_course
  Then I should be on the schedule page
  And I should see "2"


Scenario: delete course from existing schedule
  Given I am on the schedule page
  And I press "delete 1" on schedule page
  Then I should not see "delete 1"
  And I should see "Schedule '1' deleted."


Scenario: add a course that already exists
  Given I am on the schedule page
  And I follow "Add Courses" on "Fall 2022"
  Then I should be on the Add Course page for "Fall 2022"
  And I press "add Intro to CS" on add_course
  Then I should see "Course '1' already added."


