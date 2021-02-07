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
    }
    
}
