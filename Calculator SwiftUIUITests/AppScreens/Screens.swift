//
//  Screens.swift
//  Calculator SwiftUIUITests
//
//  Created by Soopee, Aghzam on 07/02/2021.
//

import XCTest

struct Screen {
    // Add all screens of the app here
    static var mainScreen: MainScreen { return MainScreen() }
}


class BaseScreen {
    
    let app = XCUIApplication()
    var screenLabel: String { fatalError("Should override screenLabel") }
    
    @discardableResult
    func waitForExistence() -> Bool {
        return app.windows[screenLabel].waitForExistence(timeout: 10)
    }
}

extension ElementHandler where Self: BaseScreen {
    func uielement(_ element: ElementType) -> Element<ElementType> {
        return Element(element)
    }
}

class Element<T> {
    var element: T
    init(_ element: T) {
        self.element = element
    }
}
