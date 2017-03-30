//
//  DataProtocolsTests.swift
//  WARPServices
//
//  Created by Oleksii on 30/03/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import XCTest
import WARPServices

class DataProtocolsTests: XCTestCase {
    
    func testCollectionContainingProtocol() {
        struct TestProvider: CollectionContaining, ItemsProviding {
            typealias ItemType = Int
            let items: [Int]?
        }
        let data = TestProvider(items: [1, 2, 3, 4])
        
        XCTAssertEqual(data.numberOfItems, data.items?.count)
        XCTAssertEqual(TestProvider(items: nil).numberOfItems, 0)
        XCTAssertEqual(data.item(at: 3), data.items?[3])
    }
    
}
