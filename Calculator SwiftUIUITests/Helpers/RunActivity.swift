//
//  RunActivity.swift
//  Calculator SwiftUIUITests
//
//  Created by Soopee, Aghzam on 07/02/2021.
//

import XCTest

func Step(_ name: String, block: () -> Void ) {
    XCTContext.runActivity(named: name, block: { _ in block() })
}

func Given(_ name: String, block: () -> Void ) {
    Step("Given \(name)", block: block)
}

func Then(_ name: String, block: () -> Void ) {
    Step("Then \(name)", block: block)
}

func When(_ name: String, block: () -> Void ) {
    Step("When \(name)", block: block)
}

func And(_ name: String, block: () -> Void ) {
    Step("And \(name)", block: block)
}
