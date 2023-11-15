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
  Given I am on the login page
  And I fill in "email" with "sma2243@columbia.edu"
  And I fill in "password" with "test"
  And I press "Login"
  Then I should be on the schedule page
  And I should see "Add Courses"


Scenario: log in with incorrect email
  Given I am on the login page
  And I fill in "email" with "cn2489@columbia.edu"
  And I fill in "password" with "test"
  And I press "Login"
  Then I should be on the login page
  And I should see "invalid email"


Scenario: log in with incorrect password
  Given I am on the login page
  And I fill in "email" with "sma2243@columbia.edu"
  And I fill in "password" with "hello"
  And I press "Login"
  Then I should be on the login page
  And I should see "incorrect password"


Scenario: navigate to other pages while being logged in
  Given I login with email sma2243@columbia.edu and password test
  And I go to the login page
  Then I should be on the schedule page


Scenario: navigate to other pages while not being logged in
  Given I am on the login page
  And I go to the schedule page
  Then I should be on the login page

Scenario: logging out
  Given I login with email sma2243@columbia.edu and password test
  Then I should be on the schedule page
  And I follow "Logout"
  Then I should be on the login page


Scenario: signing up with existing email


Scenario: signing up with existing uni


Scenario: signing up with correct information and then logging in


Scenario: signing up with incomplete information



Scenario: (optional) log in and log out and check the persisting courses






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


