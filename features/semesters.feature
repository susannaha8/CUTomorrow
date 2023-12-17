Feature: add and remove semesters

  As a student
  I can see all available courses
  I want to see all courses


Background: courses in schedule, login

  Given the following schedules are in a Schedule table:
  | schedID |   uni   | courseID | semester         | reqID | taken |
  |    1    | sma2243 |    1     |   Spring 2024    |   2   | true  |
  |    6    | sma2243 |          |   Spring 2024   |       |      |


  Then 2 seed courses should exist

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

Scenario: Add a semester
  Given I am on the schedule page
  And I select "Fall 2021" from "Year"
  And I press "Add Semester"
  Then I should see "Fall 2021"
  And I should see "2021 - 2022"

Scenario: Add an existing semester and delete a semester
  Given I am on the schedule page
  And I select "Spring 2022" from "Year"
  And I press "Add Semester"
  Then I should see "Spring 2022"
  And I select "Spring 2022" from "Year"
  And I press "Add Semester"
  Then I should see "Semester 'Spring 2022' already added."

Scenario: Delete a full semester
  Given I am on the schedule page
  Then I should see "Spring 2024"
  And I should see "2023 - 2024"
  And I should see "Intro to CS"
  And I press "Delete Semester" on "Spring 2024"
  Then I should not see "Intro to CS"
  And I should not see "2023 - 2024"
