
# QA Automation Framework for Login Testing

This repository contains an automation framework designed to test the login functionality of the Landmark Taqtics web application. 
The framework leverages the Robot Framework,SeleniumLibrary RequestsLibrary and Pabot(parallel test runner)  for UI automation and API automation testing.

## Design Approach

The framework for UI testing is designed to ensure:
- **Modularity:** The framework follows the Page Object Model (POM) design pattern, allowing for reusable keywords and a clean separation between test logic and UI elements.
- **Scalability:** Easy to extend for additional test cases.
- **Readability:** Clear documentation and descriptive test case names.

The framework for API testing is designed to ensure:
- **Modularity:** Reusable keywords for better maintainability.
- **Scalability:** Easy to extend for additional test cases.
- **Readability:** Clear documentation and descriptive test case names.

## Test cases and output HTML reports -
The test cases Excel file is provided in the repository it is named `testCases.xlsx` and .

## Features

- **UI Testing:** Automates login tests, including positive and negative scenarios.
- **Error Validation:** Validates error messages for incorrect credentials, empty fields, and invalid email formats.
- **API Testing:** Verifies the `/generateAuthToken` endpoint.
- **Reusable Keywords:** Modular keywords for common actions like login, validation, and logout.

## Tools and Technologies Used

- **Robot Framework:** A keyword-driven framework for test automation.
- **SeleniumLibrary:** For browser automation.
- **RequestsLibrary:** For api automation.
- **Pabot:** For parallel test case execution.
- **Python:** Language for custom scripts and automation logic.
- **PyCharm:** IDE for development.


## Setup Instructions

1. **Clone the repository:**
   ``` https://github.com/AtharvaGholkar/Taqtics.git```

2. **Install dependencies:**
   - Ensure you have Python installed on your system.
   - Install dependencies using requirements.txt.
     
     ```pip install -r requirements.txt```
     

3. **Setup WebDriver:**
   - Download the WebDriver (e.g., ChromeDriver) compatible with your browser version.
   - Add the WebDriver to your system's PATH or inside Scripts folder in python folder.

4. **Add or Update Variables or Keywords:**
   - Navigate to `Locators.py` to update element locators.
   - Navigate to `loginPageKeywords.robot` or `authApiKeywords.robot`  to add or update variables and keywords.

## Execution Instructions

1. To execute all ui test cases in parallel mode:
   
   ```pabot --testlevelsplit --outputdir ui_automation_testing/ui_reports ui_automation_testing/test_cases/loginTestCases.robot```
   

2. To execute all ui test cases in parallel mode:
   
   ```pabot --testlevelsplit --outputdir api_automation_testing/api_reports api_automation_testing/test_cases/authTestCases.robot```
   

3. After execution, review the reports generated in the `ui_reports/` or `api_reports/` directory based on which command has been run.



