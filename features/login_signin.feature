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
  And I should see "Select Academic Year"

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
  Given I am on the login page
  And I follow "Sign Up"
  Then I should be on the sign up page
  And I fill in "email" with "sma2243@columbia.edu"
  And I fill in "password" with "test"
  And I press "Sign Up"
  Then I should see "Email already exists!"

Scenario: signing up with existing uni
  Given I am on the login page
  And I follow "Sign Up"
  Then I should be on the sign up page
  And I fill in "uni" with "sma2243"
  And I fill in "email" with "edc2147@columbia.edu"
  And I fill in "password" with "test"
  And I press "Sign Up"
  Then I should see "UNI already exists!"

Scenario: signing up with correct information and then logging in
  Given I am on the login page
  And I follow "Sign Up"
  Then I should be on the sign up page
  And I fill in "uni" with "cn2489"
  And I fill in "email" with "cn2489@columbia.edu"
  And I fill in "password" with "test"
  And I press "Sign Up"
  Then I should be on the login page
  Then I should see "Profile created."

Scenario: signing up with incomplete information
  Given I am on the login page
  And I follow "Sign Up"
  Then I should be on the sign up page
  And I fill in "uni" with "cn2489"
  And I fill in "email" with "cn2489@columbia.edu"
  And I press "Sign Up"
  Then I should be on the sign up page
  Then I should see "Error! Information incomplete!"

Scenario: log in after session expired
  Given I login with email sma2243@columbia.edu and password test
  Then I should be on the schedule page
  And I wait for 1500 minutes and go to the login page
  Then I should see "Session has expired. Please log in again."

