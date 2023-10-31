Feature: add a course

  As a student
  So that I can create my schedule
  I want to add and remove courses from my schedule


Background: courses in schedule

  Given the following courses are in a schedule:
  | schedID |   uni  | courseID | semester | reqID | taken |
  |    1    | cn2489 |    1     |   S23    |   1   | true  |
  |    2    | cn2489 |    2     |   F23    |   2   | false |
  |    3    | cn2489 |    3     |   S24    |   3   | false |
  |    4    | cn2489 |    4     |   S24    |   4   | false |

  Then 4 seed courses should exist

Scenario: add course by search to existing schedule
  Given I am on the schedule page
  And I follow "Add Courses" on "Fall 2022"
  Then I should be on the Add Course page
  And I fill in "Search" with "CSEE W3827"
  And I press "+" on "CSEE W3827"
  Then I should be on the schedule page
  And I should see "CSEE W3827"


Scenario: add required course to existing schedule
  Given I am on the schedule page
  And I follow "Add Courses" on "Fall 2022"
  Then I should be on the Add Course page
  And I press "+" on "CSEE W3827"
  Then I should be on the schedule page
  And I should see "CSEE W3827"


Scenario: delete course from existing schedule
  Given I am on the schedule page
  And I press "-" on "COMS W3157"
  Then I should not see "COMS W3157"
  And I should see "Course 'COMS W3157' removed."


Scenario: add a course by search that already exists
  Given I am on the schedule page
  And I follow "Add Courses" on "Fall 2022"
  Then I should be on the Add Course page
  And I fill in "Search" with "CSEE W3827"
  And I press "+" on "CSEE W3827"
  Then I should see "Course 'CSEE W3827' already added."


Scenario: add a course that already exists
  Given I am on the schedule page
  And I follow "Add Courses" on "Fall 2022"
  Then I should be on the Add Course page
  And I press "+" on "CSEE W3827"
  Then I should see "Course 'CSEE W3827' already added."


