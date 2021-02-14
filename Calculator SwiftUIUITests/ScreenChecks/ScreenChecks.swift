//
//  ScreenChecks.swift
//  Calculator SwiftUIUITests
//
//  Created by Soopee, Aghzam on 07/02/2021.
//

import XCTest

extension ElementHandler where ElementType: ElementFinder {
    
    func exists(shouldExist: Bool = true, _ element: ElementType) {
        if shouldExist {
            XCTAssert(element.xcuielement.exists, "Element \(element) does not exist")
        } else {
            XCTAssertFalse(element.xcuielement.exists, "Element \(element) should not exist")
        }
    }
    
    func hasLabel(_ element: ElementType, _ label: String) {
        guard element.xcuielement.waitForExistence(timeout: 5) else {
            XCTFail("Element \(element) cannot be found")
            return
        }
        XCTAssert(element.xcuielement.label == label, "Element label is not equal to \(label)")
    }
    
    func resultHasLabel(_ label: String) {
        XCTAssert(XCUIApplication().staticTexts[label].label == label)
    }
    
    func checkKeysLayout() {
        let rows = [
            ["7", "8", "9", "÷"],
            ["4", "5", "6", "×"],
            ["1", "2", "3", "−"],
            [".", "0", "=", "+"]
        ]
        
        Screen.mainScreen.hasLabel(.button7, rows[0][0])
        Screen.mainScreen.hasLabel(.button8, rows[0][1])
        Screen.mainScreen.hasLabel(.button9, rows[0][2])
        Screen.mainScreen.hasLabel(.divideButton, rows[0][3])
        
        Screen.mainScreen.hasLabel(.button4, rows[1][0])
        Screen.mainScreen.hasLabel(.button5, rows[1][1])
        Screen.mainScreen.hasLabel(.button6, rows[1][2])
        Screen.mainScreen.hasLabel(.multiplyButton, rows[1][3])
        
        Screen.mainScreen.hasLabel(.button1, rows[2][0])
        Screen.mainScreen.hasLabel(.button2, rows[2][1])
        Screen.mainScreen.hasLabel(.button3, rows[2][2])
        Screen.mainScreen.hasLabel(.subButton, rows[2][3])
        
        Screen.mainScreen.hasLabel(.dotButton, rows[3][0])
        Screen.mainScreen.hasLabel(.button0, rows[3][1])
        Screen.mainScreen.hasLabel(.equalButton, rows[3][2])
        Screen.mainScreen.hasLabel(.addButton, rows[3][3])
    }
    
}
