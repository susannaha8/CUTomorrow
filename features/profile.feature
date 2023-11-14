Feature: edit my profile

  As a student
  So that I can edit my profile
  I want to add and remove data from my profile


Background: data in profile

  Given the following data is in a profile:
  |   uni   |  standing  |        major1         | major2 | minor1 | minor2 | minor3 |
  | sma2243 |  Fall 2023 |   Computer Science    |        |        |        |        |

 Given the following majors are in the major table
  | major_minorID |       name       |  type  |
  |       1       | Computer Science | Major  |
  |       2       |     English      | Major  |
  |       3       |    Mathematics   | Minor  |

Scenario: navigate to schedule page from nav bar
  Given I am on the schedule page
  And I follow "Profile"
  Then I should be on the Profile page
  And I should see "Uni: sma2243"
  And I should see "Standing: Fall 2023"
  And I should see "Major 1: Computer Science"

Scenario: update profile
  Given I am on the Profile page
  And I follow "Edit Profile"
  Then I should be on the Edit Profile page
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
  Given I am on the Edit Profile page
  And I press "Cancel"
  Then I should be on the Profile page
  And I should see "Uni: sma2243"
  And I should see "Standing: Fall 2023"
  And I should see "Major 1: Computer Science"

Scenario: move back to schedules page
  Given I am the Profile page
  And I follow "Back to Schedules"
  Then I should be the on schedule page



