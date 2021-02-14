# ts-calculator-ios

Test & Deployment Strategy

1) Platform considerations
- Given this is an iOS app and (assuming) we do not have a requirement to develop and support the app on another platforms, the chosen framework for the development of the test automation suite is to use Apple's UI test framework XCUITest. With the development team predominiately coming from an iOS app development background, we will be able to leverage the skill in the team to support test automation engineers in building APIs that the UI automation tests can integrate with to access and test the application. 


2) CI/CD pipeline
- We will host the app on a cloud based CI outsourcing the need to locally maintain a build server. The chosen CI is Bitrise https://www.bitrise.io/. We will be able to create UI test workflows that will allow us to run UI tests as frequently as required. Depending on the number test cases and the time it takes to run the test suite, we may schedule a specific convenient time to run the tests, e.g., overnight. If the UI test is light weight and run within few minutes, we may decide to run the UI tests on every pull request.


3) Dependency manager
- We will use Cocoapods as the dependency manager for the Swift only project. Our CI/CD tool selection above supports the use of Cocoapods on the virtual instance where builds and tests will run daily. We will use the Podfile.lock to specify the Cocoapods version and other supporting frameworks that will ensure the team uses the same set of dependencies when developing the app.


3) Additonal framework consideration
- XCUITest allows for functional testing of the application. Visual testing is not practically supported. In order to achieve visual testing that can be fed back to the product team, we will propose the use of Applitools https://applitools.com/ Eye XCUI SDK to create visual checkpoints in the automated test that will take snapshots of the application and compare between builds allowing QA and Product teams to approve changes or raise bugs. 


5) Device farm consideration
- Considering the complexity of the application to test, we may decide to use a device farm to ensure visual compliance across multiple physical devices. We can propose to use simulators in the case of a simple app that is unlikely to be using multiple OS layers that would require a physical device. E.g., no video streaming requirement or network calls, app can run without an internet connect and not intergrated to web services.


Test Automation Strategy

1) Identifying core journeys - This step allows us to identify core funtionalities for the app and user journeys that we must write automated tests for and pass for making a release candidate. Xcode has a Test plan option we can use to configure which set of tests to run. With integration to a CI, we can easily manage the test plans with Xcode build scripts as part of the build and continuous testing process.

2) Define could have tests - This step allow us to select which test we can ran in addition to the must have tests. Xcode has a Test plan option we can use to configure this and separate functional tests from performance tests for example, the latter being more subjective testing. With integration to a CI, we can easily manage the test plans with Xcode build scripts as part of the build and continuous testing process. Expanding futher depending on complexity, we can create multiple test plan for testing daily code changes and regression on release candidate. E.g., Light, medium and full regression test plans can be created to run at relevent time and frequency throughout the development process.

3) Devices to support and run the tests on - We carried out an assessment of the app and decided that we can use simulators to functionally test the app. There are no explicit specifications to support both iPhone and iPad, but we will run the test on both platforms with latest iOS versions to ensure there are no major bugs between the platforms. Given the statistics of devices from Apple, it's common to test on at least iPhone and iPad for an app with the latest iOS. Using Xcode and parallel testing with can benchmark how long tests run for and manage further as and when necessary based on time it takes to run tests, subset of tests, and/or depending on growing number of tests to run.

4) Architecture of test in XCUI - We are using the Page Object model to define the UI test architecture. State/value checks methods will be separate from perform actions methods to improve organisation. Methods that can be used across multiple screens will be added to a Base Screen class. Methods with specific functions related to a specific screen will be separate from the main Base Screen class. Each screen of the app will have a UI element locator class, the mainScreen class in this case as the app has only one screen. We will use swift enumeration to define and store the UI elements as it's practical to manage. It allows us to group elements by types, assign them accessiblity identifiers or unique values to faciliate locating UI elements on a particular screen. They are also easily accessible across the UI test target without the need to create instances.

5) Test data considerations - We can create a sensible list of test data (in this casea range of numbers) we can use to test the application operation. The scope of this is to be discussed with the client. E.g, operation on positive and negative numbers, decimals. 


Bugs report
While writing the UI tests the following issues were found:
1) The plus operation is missing and fails the key layout test testCalculatorKeysLayout(). This consequently also failed the addition test as the operator cannot be found testAddTwoNumbers().
2) Using operations on negative values is crashing the app, test testSubTwoNumbersWithDataSet(). E.g., enter -9+10. 
Additional notes:
- App appears to use single decimal place, to TBC with requirements
