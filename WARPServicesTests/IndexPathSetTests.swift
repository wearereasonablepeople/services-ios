//
//  IndexPathSetTests.swift
//  WARPServices
//
//  Created by Oleksii on 09/03/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import XCTest
import WARPServices

class IndexPathSetTests: XCTestCase {
    let set = IndexPathSet(deleted: [0], inserted: [1], updated: [2, 3])
    
    func testIndexPathSetInit() {
        XCTAssertEqual(set.deleted, [IndexPath(row: 0, section: 0)])
        XCTAssertEqual(set.inserted, [IndexPath(row: 1, section: 0)])
        XCTAssertEqual(set.updated, [IndexPath(row: 2, section: 0), IndexPath(row: 3, section: 0)])
    }
    
    func testIndexPathSetHashable() {
        XCTAssertEqual(set, IndexPathSet(deleted: [0], inserted: [1], updated: [2, 3]))
        XCTAssertEqual(set.hashValue, IndexPathSet(deleted: [0], inserted: [1], updated: [2, 3]).hashValue)
        XCTAssertNotEqual(IndexPathSet(deleted: [0], inserted: [1], updated: [0]).hashValue, IndexPathSet(deleted: [2], inserted: [1], updated: [2]).hashValue)
    }
    
}
