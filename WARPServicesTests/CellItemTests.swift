//
//  CellItemTests.swift
//  WARPServices
//
//  Created by Oleksii on 31/03/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import XCTest
import WARPServices

class CellItemTests: XCTestCase {
    let cell = UITableViewCell()
    let indexPath = IndexPath(row: 0, section: 0)
    lazy var cellItem: CellItem<Int, UITableViewCell> = CellItem(item: 3, cell: self.cell, at: self.indexPath)
    
    func testCellItemEquatable() {
        XCTAssertTrue(cellItem == CellItem(item: 3, cell: cell, at: indexPath))
        XCTAssertFalse(cellItem == CellItem(item: 4, cell: cell, at: indexPath))
        XCTAssertFalse(cellItem == CellItem(item: 3, cell: UITableViewCell(), at: indexPath))
        XCTAssertFalse(cellItem == CellItem(item: 3, cell: cell, at: IndexPath(row: 0, section: 1)))
    }
    
    func testCellItemMap() {
        XCTAssertTrue(cellItem.map(String.init) == CellItem(item: "3", cell: cell, at: indexPath))
    }
    
}
