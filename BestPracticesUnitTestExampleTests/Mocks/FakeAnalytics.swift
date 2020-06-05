//
//  FakeAnalytics.swift
//  BestPracticesUnitTestExampleTests
//
//  Created by dario vallejo on 1/06/20.
//  Copyright © 2020 dario vallejo. All rights reserved.
//

import Foundation
@testable import BestPracticesUnitTestExample

class FakeAnalytics: Analytics {
    
    var selectedState: StoreType?
    
    func logFilterSelected(_ state: StoreType) {
        self.selectedState = state
    }
}
