Feature: add a course

  As a student
  So that I can create my schedule
  I want to add and remove courses from my schedule


Background: courses in schedule

  Given the following courses are in a schedule:
  | schedID |   uni   | courseID | semester | reqID | taken |
  |    1    | sma2243 |    1     |   S23    |   1   | true  |
  |    2    | sma2243 |    5     |   F23    |   2   | false |
  |    3    | sma2243 |    3     |   S24    |   3   | false |
  |    4    | sma2243 |    4     |   S24    |   4   | false |

  Then 4 seed courses should exist

  Given the following requirements are in the requirements table
  | reqID | reqLabel | major_minorID |
  | 1     | firstReq | 1             |

  Given the following courses are in the course directory
  | courseID| courseTitle | courseCode |
  |    1    | Intro to CS | 1004       |
  |    2    | Fundamentals | 3827      |

  Given the following pairs are in coursereqs
  |coursereqsID | reqID | courseID |
  | 1           |   1   |     1     |
  | 2           |   1   |     2     |

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


