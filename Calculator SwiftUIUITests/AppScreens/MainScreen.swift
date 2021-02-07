//
//  MainScreen.swift
//  Calculator SwiftUIUITests
//
//  Created by Soopee, Aghzam on 07/02/2021.
//

import XCTest

protocol MainScreenElements: ElementFinder {
    
}

class MainScreen: BaseScreen, ElementHandler {
    
    typealias ElementType = MainScreen.Element
    
    override var screenLabel: String { return "CXTS" }
    
    enum Element: String, MainScreenElements {
        case button0 = "0"
        case button1 = "1"
        case button2 = "2"
        case button3 = "3"
        case button4 = "4"
        case button5 = "5"
        case button6 = "6"
        case button7 = "7"
        case button8 = "8"
        case button9 = "9"
        case addButton = "+"
        case subButton = "−"
        case multiplyButton = "×"
        case divideButton = "÷"
        case equalButton = "="
        case dotButton = "."
        case resultLabel = "CXTS"
        case resetLabel = "0.0"
        
        var type: XCUIElement.ElementType {
            switch self {
            case .button0,
                 .button1,
                 .button2,
                 .button3,
                 .button4,
                 .button5,
                 .button6,
                 .button7,
                 .button8,
                 .button9,
                 .addButton,
                 .subButton,
                 .multiplyButton,
                 .divideButton,
                 .equalButton,
                 .dotButton:
                return .button
            case .resultLabel,
                 .resetLabel:
                return .staticText
            }
        }
        
        var identifier: String {
            self.rawValue
        }
    }
}
