//
//  ScreenActions.swift
//  Calculator SwiftUIUITests
//
//  Created by Soopee, Aghzam on 07/02/2021.
//

import XCTest

extension ElementHandler where ElementType: ElementFinder {
    
    func tap(_ uiElement: ElementType, timeout: TimeInterval = 5) {
        guard uiElement.xcuielement.waitForExistence(timeout: timeout) else {
            XCTFail("Element \(uiElement) cannot be found")
            return
        }
        uiElement.xcuielement.tap()
    }
    
    private func keyPress(firstNumber: Double, secondNumber: Double, operatorElement: XCUIElement, timeout: TimeInterval = 5) {
        enterNumber(firstNumber)
        operatorElement.tap()
        enterNumber(secondNumber)
    }
    
    private func enterNumber(_ number: Double) {
        for i in String(number) {
            // handle "-" character
            if i == "-" {
                XCUIApplication().buttons["−"].tap()
            } else {
                XCUIApplication().buttons[String(i)].tap()
            }
        }
    }
    
    func addNumber(_ firstNumber: Double, _ secondNumber: Double) -> String {
        let uiOperatorElement = Screen.mainScreen.uielement(.addButton).element.xcuielement
        keyPress(firstNumber: firstNumber, secondNumber: secondNumber, operatorElement: uiOperatorElement)
        return String(firstNumber + secondNumber)
    }
    
    func subtractNumber(_ firstNumber: Double, _ secondNumber: Double) -> String {
        let uiOperatorElement = Screen.mainScreen.uielement(.subButton).element.xcuielement
        keyPress(firstNumber: firstNumber, secondNumber: secondNumber, operatorElement: uiOperatorElement )
        return String(firstNumber - secondNumber)
    }
    
    func multiplyNumber(_ firstNumber: Double, _ secondNumber: Double) -> String {
        let uiOperatorElement = Screen.mainScreen.uielement(.multiplyButton).element.xcuielement
        keyPress(firstNumber: firstNumber, secondNumber: secondNumber, operatorElement: uiOperatorElement )
        return String(firstNumber * secondNumber)
    }
    
    func divideNumber(_ firstNumber: Double, _ secondNumber: Double) -> String {
        let uiOperatorElement = Screen.mainScreen.uielement(.divideButton).element.xcuielement
        keyPress(firstNumber: firstNumber, secondNumber: secondNumber, operatorElement: uiOperatorElement )
        return String(firstNumber / secondNumber)
    }
}
