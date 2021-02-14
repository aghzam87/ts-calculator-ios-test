//
//  FunctionalTests.swift
//  Calculator SwiftUIUITests
//
//  Created by Soopee, Aghzam on 07/02/2021.
//

import XCTest

class FunctionalTests: BaseTestCase {
    
    var resultLabel: String = "CXTS"
    
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
        When("user adds two numbers") { resultLabel = Screen.mainScreen.subtractNumber(7,10) }
        And("user taps equal") { Screen.mainScreen.tap(.equalButton) }
        Then("the result label display the correct answer") { Screen.mainScreen.resultHasLabel(resultLabel) }
    }
}
