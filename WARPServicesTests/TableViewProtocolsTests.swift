//
//  TableViewProtocolsTests.swift
//  WARPServices
//
//  Created by Oleksii on 26/09/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import XCTest
import WARPServices

struct StringSource: DataContaining, ItemsProviding {
    typealias ItemType = String
    let data = ["Some", "test", "strings"]
}

extension StringSource: TableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

class TableViewProtocolsTests: XCTestCase {
    func testDataContainingAndItemsProvidingExtension() {
        let source = StringSource()
        
        XCTAssertEqual(source.numberOfItems, source.data.count)
        for (index, element) in source.data.enumerated() {
            XCTAssertEqual(source.item(at: index), element)
        }
    }
    
    func testItemsProvidingAndTableViewDataSourceExtension() {
        let source = StringSource()
        let tableView = UITableView()
        
        XCTAssertEqual(source.numberOfSections(in: tableView), 1)
        XCTAssertEqual(source.tableView(tableView, numberOfRowsInSection: 0), source.data.count)
        XCTAssertEqual(source.tableView(tableView, titleForFooterInSection: 0), nil)
        XCTAssertEqual(source.tableView(tableView, titleForHeaderInSection: 0), nil)
    }
}
