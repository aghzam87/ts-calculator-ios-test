//
//  ElementFinder.swift
//  Calculator SwiftUIUITests
//
//  Created by Soopee, Aghzam on 07/02/2021.
//

import XCTest

protocol ElementHandler {
    associatedtype ElementType
}

protocol ElementFinder {
    var identifier: String { get }
    var type: XCUIElement.ElementType { get }
    var xcuielement : XCUIElement { get }
}

extension ElementFinder {
    var xcuielement: XCUIElement {
        
        let app = XCUIApplication()
        
        switch self.type {
        case .staticText: return app.staticTexts[identifier].firstMatch
        case .button: return app.buttons[identifier].firstMatch
        default:
            return app.otherElements[identifier].firstMatch
        }
    }
}
