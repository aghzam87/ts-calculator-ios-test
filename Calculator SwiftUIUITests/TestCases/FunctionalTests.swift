//
//  FunctionalTests.swift
//  Calculator SwiftUIUITests
//
//  Created by Soopee, Aghzam on 07/02/2021.
//

import XCTest

class FunctionalTests: BaseTestCase {
    
    // Smoke test app launches
    func testAppLaunch() {
        app.launch()
    }
    
    // Tests
    func testMainScreenVisible() {
        Given("app launches") { app.launch() }
        And("main screen appears") { Screen.mainScreen.waitForExistence() }
    }
}
