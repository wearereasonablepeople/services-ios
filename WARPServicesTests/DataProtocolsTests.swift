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
    
    func testArrayItemsProviding() {
        let data = [1, 2, 3, 4, 5, 6]
        
        XCTAssertEqual(data.data.count, data.count)
        XCTAssertEqual(data.data[3], data[3])
    }
    
}
