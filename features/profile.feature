Feature: edit my profile

  As a student
  So that I can edit my profile
  I want to add and remove data from my profile


Background: data in profile


 Given the following majors are in the major table
  | major_minorID |       name       |  mtype |
  |       1       | Computer Science | Major  |
  |       2       |     English      | Major  |
  |       3       |    Mathematics   | Minor  |

  Given the following students are in a Student table
  | id | uni     | email                | password| major1 | standing  |
  | 1  | sma2243 | sma2243@columbia.edu | test    | 1      | Fall 2023 |

 Given I login with email sma2243@columbia.edu and password test

Scenario: navigate to schedule page from nav bar
  Given I am on the schedule page
  And I follow "Profile" on "schedule page"
  Then I should be on the profile page
  And I should see "Uni: sma2243"
  And I should see "Standing: Fall 2023"
  And I should see "Major 1: 1"

Scenario: update profile
  Given I am on the profile page
  And I follow "Edit Profile" on "profile page"
  Then I should be on the edit profile page
  And I select "Spring 2024" from "Standing"
  And I select "English" from "Major 2"
  And I select Mathematics from "Minor 1"
  And I press "Update Profile"
  Then I should be on the Profile page
  And I should see "Profile was successfully updated."
  And I should see "Uni: sma2243"
  And I should see "Standing: Fall 2023"
  And I should see "Major 1: Computer Science"
  And I should see "Major 2: English"
  And I should see "Minor 1: Mathematics"
  
Scenario: cancel updates
  Given I am on the edit profile page
  And I follow "Cancel"
  Then I should be on the profile page
  And I should see "Uni: sma2243"
  And I should see "Standing: Fall 2023"
  And I should see "Major 1: 1"

Scenario: move back to schedules page
  Given I am on the profile page
  And I follow "Back to Schedules" 
  Then I should be on the schedule page



