Feature: add a course

  As a student
  So that I can create my schedule
  I want to add and remove courses from my schedule


Background: courses in schedule

  Given the following courses are in a schedule:
  | courseID | semester | reqID | completed |
  | COMS | s23 | 1 | yes |
  | 2 | f23 | 2 | no |
  | 3 | f23 | 3 | no |
  | 4 | s24 | 4 | no |

  Then 4 seed courses should exist

Scenario: add course by search to existing schedule
Given I am on the schedule page
And I follow "Add Courses" on Fall 2022
Then I should be on the Add Course page
And I fill in course search with "CSEE W3827"
And I press plus on "CSEE W3827"
Then I should be on the schedule page
And I should see "CSEE W3827"


Scenario: add required course to existing schedule
Given I am on the schedule page
And I follow "Add Courses" on Fall 2022
Then I should be on the Add Course page
And I press plus on "CSEE W3827"
Then I should be on the schedule page
And I should see "CSEE W3827"


Scenario: delete course from existing schedule
Given I am on the schedule page
And I press minus on "COMS W3157"
Then I should not see "COMS W3157"
And I should see "Course 'COMS W3157' removed."


Scenario: add a course by search that already exists
Given I am on the schedule page
And I follow "Add Courses" on Fall 2022
Then I should be on the Add Course page
And I fill in course search with "CSEE W3827"
And I press plus on "CSEE W3827"
Then I should see "Course 'CSEE W3827' already added."


Scenario: add a course that already exists
Given I am on the schedule page
And I follow "Add Courses" on Fall 2022
Then I should be on the Add Course page
And I fill in course search with "CSEE W3827"
And I press plus on "CSEE W3827"
Then I should see "Course 'CSEE W3827' already added."


Features:

1) adding classes
2) search courses
3) search requirements
__
4) create a profile

