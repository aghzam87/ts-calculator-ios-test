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
    
}
