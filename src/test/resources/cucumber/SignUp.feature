@Registration
Feature: Registration
  As an Un-registered User of the application
  I want to validate the Registration functionality
  In order to check if it works as desired

  Background: User navigates to Registration page
    Given I navigate to the "Registration" page

  @SuccessfulRegistration
  Scenario Outline: Successful Registration using valid credentials
    When I fill in "username" with "<username>"
    And I fill in "email" with "<email>"
    And I fill in "password" with "<password>"
    And I fill in "confirmPassword" with "<confirmPassword>"
    And I click on the "Register" button
    Then I should be successfully registered
    Examples:
      | username | email     | password | confirmPassword |
      | test     | test@test | test     | test            |


  @DisabledRegistration
  Scenario Outline: Disabled Registration when one of the required fields is left blank
    When I fill in "username" with "<username>"
    And I fill in "email" with "<email>"
    And I fill in "password" with "<password>"
    And I fill in "confirmPassword" with "<confirmPassword>"
    And I click on the "Register" button
    Then I should see "<form error>" message for "<input field>" field on "Registration" page
    Examples:
      | username | email             | password | confirmPassword | form error               | input field     |
      |          | cucumber@cucumber | cucumber | cucumber        | Username cannot be empty | username        |
      | cucumber |                   | cucumber | cucumber        | Email cannot be empty    | email           |
      | cucumber | cucumber          | cucumber | cucumber        | Email is not valid       | email           |
      | cucumber | cucumber@cucumber |          | cucumber        | Password cannot be empty | password        |
      | cucumber | cucumber@cucumber |          | cucumber        | Passwords don't match    | confirmPassword |