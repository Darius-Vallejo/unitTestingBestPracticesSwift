//
//  InteractionTests.swift
//  BestPracticesUnitTestExampleTests
//
//  Created by dario vallejo on 5/06/20.
//  Copyright © 2020 dario vallejo. All rights reserved.
//

import XCTest
@testable import BestPracticesUnitTestExample

class InteractionTests: XCTestCase {
    
    var storeContainer: StoresContainer!

    override func setUp() {
        super.setUp()
        let storesFactoryStub = FakeStoresFactory()
        storeContainer = StoresContainer(analytics: AnalyticsLogger(), stores: storesFactoryStub.stores)
    }
    
    func testLogFilterSelected_callingSetup_analyticFailed() {
        let analyticsMock = FakeAnalytics()
        storeContainer.setup(analytics: analyticsMock)
        storeContainer.setup(state: .all)
        XCTAssertNil(analyticsMock.selectedState)
    }
    
    func testLogFilterSelected_callingSetup_analyticSent() {
        let analyticsMock = FakeAnalytics()
        storeContainer.setup(analytics: analyticsMock)
        storeContainer.setup(state: .mark)
        XCTAssertNotNil(analyticsMock.selectedState)
    }
    
    func testLogFilterSelected_callingSetup_rightAnalyticSent() {
        let analyticsMock = FakeAnalytics()
        storeContainer.setup(analytics: analyticsMock)
        storeContainer.setup(state: .rest)
        XCTAssertEqual(analyticsMock.selectedState, StoreType.rest)
    }
}
