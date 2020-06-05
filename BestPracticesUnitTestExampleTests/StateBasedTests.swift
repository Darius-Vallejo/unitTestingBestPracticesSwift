//
//  StateBasedTests.swift
//  BestPracticesUnitTestExampleTests
//
//  Created by dario vallejo on 1/06/20.
//  Copyright © 2020 dario vallejo. All rights reserved.
//

import Foundation


import XCTest
@testable import BestPracticesUnitTestExample

class StateBasedTests: XCTestCase {
    
    var storeContainer: StoresContainer!

    override func setUp() {
        super.setUp()
        let stores = [Store(type: .rest), Store(type: .rest),Store(type: .rest), Store(type: .mark), Store(type: .mark)]
        storeContainer = StoresContainer(analytics: AnalyticsLogger(), stores: stores)
    }
    
    // MARK: state based
    
    func testGetStores_filteredByRest_returnsJustThree() {
        storeContainer.setup(state: .rest)
        let filteredStores = storeContainer.stores
        XCTAssertEqual(filteredStores.count, 3)
    }
    
    func testGetStores_withoutFilters_returnsInitialQuantity() {
        let filteredStores = storeContainer.stores
        XCTAssertEqual(filteredStores.count, 5)
    }
    
    func testStoreValidation_withMarkFilter_returnsFalse() {
        storeContainer.setup(state: .mark)
        XCTAssertFalse(storeContainer.storeValidation(store: Store(type: .rest)))
    }

}
