Feature: Login
  Scenario: User is able to login successfully
    Given I am in the Login page
    When I fill the "email_field" with "test@up.pt"
    And I fill the "password_field" with "password"
    And I tap the "LoginButton" button 1 times
    Then I expect to be redirected into the Following Page