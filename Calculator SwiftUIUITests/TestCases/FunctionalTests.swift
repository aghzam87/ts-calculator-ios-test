//
//  FunctionalTests.swift
//  Calculator SwiftUIUITests
//
//  Created by Soopee, Aghzam on 07/02/2021.
//

import XCTest

class FunctionalTests: BaseTestCase {
    
    var resultLabel: String = "CXTS"
    
    let testData = [
        [10, 20], [30, 40], [-9, 3], [25.0, 12.5]
    ]
    
    // Smoke test app launches
    func testAppLaunch() {
        app.launch()
    }
    
    // Tests
    func testMainScreenVisible() {
        Given("app launches") { app.launch() }
        And("main screen appears") { Screen.mainScreen.waitForExistence() }
    }
    
    func testCalculatorKeysLayout() {
        Given("app launches") { app.launch() }
        And("main screen appears") { Screen.mainScreen.waitForExistence() }
        Then("the calculator keys layout is in order") { Screen.mainScreen.checkKeysLayout() }
    }
    
    func testAddTwoNumbers() {
        Given("app launches") { app.launch() }
        And("main screen appears") { Screen.mainScreen.waitForExistence() }
        When("user adds two numbers") { resultLabel = Screen.mainScreen.addNumber(10,10) }
        And("user taps equal") { Screen.mainScreen.tap(.equalButton) }
        Then("the result label display the correct answer") { Screen.mainScreen.hasLabel(.resultLabel, resultLabel) }
    }
    
    func testSubTwoNumbers() {
        Given("app launches") { app.launch() }
        When("user subtracts two numbers") { resultLabel = Screen.mainScreen.subtractNumber(7,10) }
        And("user taps equal") { Screen.mainScreen.tap(.equalButton) }
        Then("the result label display the correct answer") { Screen.mainScreen.resultHasLabel(resultLabel) }
    }
    
    func testMultiplyTwoNumbers() {
        Given("app launches") { app.launch() }
        When("user multiplies two numbers") { resultLabel = Screen.mainScreen.multiplyNumber(7,10) }
        And("user taps equal") { Screen.mainScreen.tap(.equalButton) }
        Then("the result label display the correct answer") { Screen.mainScreen.resultHasLabel(resultLabel) }
    }
    
    func testDivideTwoNumbers() {
        Given("app launches") { app.launch() }
        When("user multiplies two numbers") { resultLabel = Screen.mainScreen.divideNumber(25,2.5) }
        And("user taps equal") { Screen.mainScreen.tap(.equalButton) }
        Then("the result label display the correct answer") { Screen.mainScreen.resultHasLabel(resultLabel) }
    }
    
    // Test with a list of test data, we can do this iteration for all other operations
    func testSubTwoNumbersWithDataSet() {
        Given("app launches") { app.launch() }
        for testData in self.testData {
            When("user subtracts two numbers") { resultLabel = Screen.mainScreen.subtractNumber(testData[0], testData[1]) }
            And("user taps equal") { Screen.mainScreen.tap(.equalButton) }
            Then("the result label display the correct answer") { Screen.mainScreen.resultHasLabel(resultLabel) }
        }
    }
}
