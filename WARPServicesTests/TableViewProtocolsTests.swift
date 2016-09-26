//
//  TableViewProtocolsTests.swift
//  WARPServices
//
//  Created by Oleksii on 26/09/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import XCTest
import WARPServices

struct StringSource: DataContaining, ItemsProviding{
    typealias ItemType = String
    let data = ["Some", "test", "strings"]
}

class TableViewProtocolsTests: XCTestCase {
    func testDataContainingAndItemsProvidingExtension() {
        let source = StringSource()
        
        XCTAssertEqual(source.numberOfItems, source.data.count)
        for (index, element) in source.data.enumerated() {
            XCTAssertEqual(source.item(at: index), element)
        }
    }
}
