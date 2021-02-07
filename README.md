# ts-calculator-ios

Test & Deployment Strategy

1) Platform considerations
Given this is an iOS app and (assuming) we do not have a requirement to develop and support the app on another platforms, the chosen framework for the development of the test automation suite is to use Apple's UI test framework XCUITest. With the development team predominiately coming from an iOS app development background, we will be able to leverage the skill in the team to support test automation engineers in building APIs that the UI automation tests can integrate with to access and test the application. 


2) CI/CD pipeline
We will host the app on a cloud based CI outsourcing the need to locally maintain a build server. The chosen CI is Bitrise https://www.bitrise.io/. We will be able to create UI test workflows that will allow us to run UI tests as frequently as required. Depending on the number test cases and the time it takes to run the test suite, we may schedule a specific convenient time to run the tests, e.g., overnight. If the UI test is light weight and run within few minutes, we may decide to run the UI tests on every pull request.


3) Dependency manager
We will use Cocoapods as the dependency manager for the Swift only project. Our CI/CD tool selection above supports the use of Cocoapods on the virtual instance where builds and tests will run daily. We will use the Podfile.lock to specify the Cocoapods version and other supporting frameworks that will ensure the team uses the same set of dependencies when developing the app.


3) Additonal framework
XCUITest allows for functional testing of the application. Visual testing is not practically supported. In order to achieve visual testing that can be fed back to the product team, we will propose the use of Applitools https://applitools.com/ Eye XCUI SDK to create visual checkpoints in the automated test that will take snapshots of the application and compare between builds allowing QA and Product teams to approve changes or raise bugs. 


5) Device farm
Considering the complexity of the application to test, we may decide to use a device farm to ensure visual compliance across multiple physical devices. We can propose to use simulators only in the case of a simple app that is unlikely to be using multiple OS layers that would require a physical device. E.g., no video streaming requirement or network calls, app can run without an internet connect.


Test Automation Strategy

Functional testing 
1) Identifying core journeys


2) Defining must have tests


3) Define could have tests




Performance testing


Platform testing
4) Devices to support and run the tests on - We carried out an assessment of the app and decided that we can use simulators to functionally test the app. 
