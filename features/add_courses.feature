Feature: add a course

  As a student
  So that I can create my schedule
  I want to add and remove courses from my schedule


Background: courses in schedule, login

  Given the following schedules are in a Schedule table:
  | schedID |   uni   | courseID | semester         | reqID | taken |
  |    1    | sma2243 |    1     |   Spring 2023    |   2   | true  |
  |    2    | sma2243 |    5     |   Fall 2023      |   2   | false |
  |    3    | sma2243 |    3     |   Spring 2024    |   3   | false |
  |    4    | sma2243 |    4     |   Spring 2024    |   4   | false |
  |    5    | sma2243 |          |   Spring 2023   |       |      |
  |    6    | sma2243 |          |   Spring 2024   |       |      |
  |    7    | sma2243 |          |   Fall 2022     |       |      |


  Then 7 seed courses should exist

  Given the following majors are in a Major table
  | major_minorID | name            | mtype |
  |1              | Computer Science| major |

  Given the following courses are in a Course table
  | courseID| courseTitle  | courseCode | prefixCode |
  |    1    | Intro to CS  | 1004       | COMS       |
  |    2    | Fundamentals | 3827       | COMS       |
  |    3    | CS Theory    | 3124       | COMS       |

  Given the following requirements are in a Requirement table
  | reqID | reqLabel | major_minorID | courses   |
  | 1     | firstReq | 1             | COMS 3827 |
  | 2     | secondReq | 1             | COMS 1004 |

  Given the following pairs are in a Coursereq table
  | coursereqsID | reqID | courseID |
  | 1            | 1      | 2       |
  | 2            | 2      | 1       |

  Given the following students are in a Student table
  | id | uni     | email                | password| major1 |
  | 1  | sma2243 | sma2243@columbia.edu | test    | 1      |

  Given I login with email sma2243@columbia.edu and password test

Scenario: add required course to existing schedule
  Given I am on the schedule page
  And I follow "Add Courses" on semester "Fall 2022"
  Then I should be on the Add Course page for "Fall 2022"
  And I press "add" on "Fundamentals"
  Then I should be on the schedule page
  And I should see "Fundamentals"


Scenario: delete course from existing schedule
  Given I am on the schedule page
  And I follow "Add Courses" on semester "Fall 2022"
  Then I should be on the Add Course page for "Fall 2022"
  And I press "add" on "Fundamentals"
  Then I should be on the schedule page
  And I should see "Fundamentals"
  And I press "delete" on "Intro to CS"
  And I should see "Course 'Intro to CS' deleted."


Scenario: add a course that already exists
  Given I am on the schedule page
  And I follow "Add Courses" on semester "Fall 2022"
  Then I should be on the Add Course page for "Fall 2022"
  And I press "add" on "Intro to CS"
  Then I should see "Course 'Intro to CS' already added."

