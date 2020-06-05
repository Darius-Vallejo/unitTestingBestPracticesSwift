//
//  ValueBasedTests.swift
//  BestPracticesUnitTestExampleTests
//
//  Created by dario vallejo on 1/06/20.
//  Copyright © 2020 dario vallejo. All rights reserved.
//

import Foundation


import XCTest
@testable import BestPracticesUnitTestExample

class ValueBasedTests: XCTestCase {
    
    var calculator: Calculator!

    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    // MARK: Wrong Nomenclature
    func testMultiplication() {
        let a: Float = 0
        let b: Float = 2
        let result = calculator.multiplication(a: a, b: b)
        assert(result == 0)
    }
    
    // MARK: Right Nomenclature
    func testMultiplication_byZero_returnsZero() {
        let a: Float = 0
        let b: Float = 2
        let result = calculator.multiplication(a: a, b: b)
        XCTAssertEqual(result, 0)
    }

}
