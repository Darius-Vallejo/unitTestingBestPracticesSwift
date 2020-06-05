//
//  FakeStoresFactory.swift
//  BestPracticesUnitTestExampleTests
//
//  Created by dario vallejo on 1/06/20.
//  Copyright © 2020 dario vallejo. All rights reserved.
//

import Foundation
import BestPracticesUnitTestExample

class FakeStoresFactory {
    var stores: [Store] {
        return [Store(type: .rest), Store(type: .rest),Store(type: .rest), Store(type: .mark),Store(type: .mark)]
    }
}
