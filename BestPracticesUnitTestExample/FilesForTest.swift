//
//  FilesForTest.swift
//  BestPracticesUnitTestExample
//
//  Created by dario vallejo on 31/05/20.
//  Copyright © 2020 dario vallejo. All rights reserved.
//

import Foundation


// MARK: VALUE-BASED Implementation
struct Calculator {
    func multiplication(a: Float, b: Float) -> Float {
        return a * b
    }
}


// MARK: STATE-BASED Implementation
public enum StoreType {
    case all
    case rest
    case mark
}

public struct Store {
    let type: StoreType
    public init(type: StoreType) {
        self.type = type
    }
}

struct StoresContainer {
    private var originalStores = [Store]()
    private var currentState: StoreType = .all
    private var analytics: Analytics
    
    init(analytics: Analytics, stores: [Store]) {
        self.analytics = analytics
        self.originalStores = stores
    }
    
    mutating func setup(analytics: Analytics) {
        self.analytics = analytics
    }
    
    mutating func setup(state: StoreType) {
        if state != .all {
            analytics.logFilterSelected(state)
        }
        currentState = state
    }
    
    func storeValidation(store: Store) -> Bool {
        if currentState == .all {
            return true
        }
        return store.type == currentState
    }
    
    var stores: [Store] {
        return originalStores.filter(storeValidation)
    }
}


// MARK: INTERACTION-BASED Implementation
protocol Analytics {
    func logFilterSelected(_ state: StoreType)
}

struct AnalyticsLogger: Analytics {
    init() {}
    func logFilterSelected(_ state: StoreType) {
        // Send Analyics
        print(state)
    }
}







