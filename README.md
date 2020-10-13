# SprintQA Karate Framework

This automation framework is based on Intuit Karate tool, the only open-source tool to combine API test-automation, mocks, performance-testing and even UI automation into a single, unified framework. 

This README includes information about the installation guide, framework structure and instructions to execute feature files.

## Getting Started

These instructions will get you a copy of this framework up and running on your local machine.

### Installation Guide

* [Install Visual Studio Code on Windows] https://code.visualstudio.com/docs/setup/windows 
* [Install Visual Studio Code on MacOS] https://code.visualstudio.com/docs/setup/mac  
* [Install Apache Maven] https://maven.apache.org/install.html

#### VS Code Extensions

* Java Extension Pack by Microsoft
* Karate Runner by Kirk Slota
* Cucumber (Gherkin) Full Language Support by Alexander Krechik
* Feature Syntax Highlight and Snippets (Cucumber/Gherkin) by Roland Orosz

### Technologies

* Intuit Karate v0.9.6 - for REST API & UI Automation Testing  
* Java JDK 8 - for Development   
* Apache Maven v3.6.3 - as Build Tool   

### External Libraries Used

* Apache Commons Validator v1.7 - for both client side and server side data validation  
* Apache Commons IO v2.8.0 - utility classes, stream implementations, file filters, file comparators, etc.
* Cucumber Reporting v4.8.0 - provides pretty html reports for Cucumber
* JSON In Java v20200518 - JSON encoders/decoders in Java

### Plugins

* Maven Compiler v3.8.0 - for compiling the project   
* Maven Surefire v2.22.2 - to execute tests with specified configurations and goals   

## Project Structure

### src/test/java/demo

- contains **api/petstore** which has a feature file for petstore API testing scenarios
- contains **samples** which has sample feature file to learn about how to write descriptive Karate scenarios
- contains **web** which has a feature file to demonstrate how UI testing works in Karate   

### src/test/java/utils

- contains the **Reporter.java** for logging test results to Cucumber Report 

### pom.xml 

- contains the information of the project and configurations to build the project such as dependencies, build directory, source directory, test source directory, plugins, goals etc.  

### karate-config.js  

Just like in any other framework we have properties files which holds all the configuration variables. Karate expects a file called karate-config.js to exist in the class path and contains a function JavaScript. This function is expected to return the JSON object, and that all keys and values for that JSON object will be available as script variables. You can use this file to set other common variables as Environment, AppID , AppSecret etc.
Read more on: https://github.com/intuit/karate#configuration


## SprintQA Karate Framework Tests Reports

- **target/cucumber-html-reports** folder contains overview-features.htnl report for all our tests.
- **target/surefire-reports** folder contains karate-summary.html report for all our tests.     

## Guide to Execute Test Suites

Please either clone this project or download it on your local machine. Once done, please follow below steps to execute the Petstore API tests.   

### Executing the Petstore API Test Scenarios

mvn clean compile test '**-D**karate.env=**e2e**' '**-D**karate.options=**"--tags @pet"**' '**-D**test=**KarateRunner"**' 

### Executing the OrangeHRM UI Test Scenarios

mvn clean compile test '**-D**karate.env=**e2e**' '**-D**karate.options=**"--tags @ui"**' '**-D**test=**KarateRunner"**' 

## Author

* MUHAMMAD TAFSEER HAIDER    
  Instructor, SprintQA
