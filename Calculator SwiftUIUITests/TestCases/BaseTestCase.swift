//
//  BaseTestCase.swift
//  Calculator SwiftUIUITests
//
//  Created by Soopee, Aghzam on 07/02/2021.
//

import XCTest

class BaseTestCase: XCTestCase {
    
    lazy var app = XCUIApplication()

    var device: XCUIDevice!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        device = XCUIDevice.shared
        // Starts each test in portrait mode
        device.orientation = .portrait
    }
    
    override func tearDown() {
        app.terminate()
        super.tearDown()
    }
}
