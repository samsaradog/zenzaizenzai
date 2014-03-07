Feature: Editing fields on a user

  Scenario: Editing the gets_daily_dharma option
    Given a user in the system
    And a jewel in the system
    And the user is not subscribed
    When the user logs in
    And the user edits their profile
    And the user subscribes
    And the user edits their profile
    Then they should see that they are subscribed
