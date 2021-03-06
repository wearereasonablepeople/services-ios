//
//  TableViewProtocolsTests.swift
//  WARPServices
//
//  Created by Oleksii on 26/09/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import XCTest
import UIKit
import WARPServices

private class SourceProvider: DataContaining {
    struct SourceItem: CellIdentifierProvider {
        let value: String
        let cellIdentifier: SourceProvider.CellIdentifier
    }
    typealias ItemType = SourceItem

    var sourceValidationCallback: ((SourceItem) -> Void)?
    let data: [SourceItem] = [SourceItem(value: "Some", cellIdentifier: .some), SourceItem(value: "test", cellIdentifier: .test), SourceItem(value: "strings", cellIdentifier: .test)]
}

extension SourceProvider: CellProviderType, TableViewDataSourceType {
    enum CellIdentifier: String {
        case test, some
    }
    
    func configure(item: CellItem<SourceItem, UITableViewCell>) {
        sourceValidationCallback?(item.item)
    }
}

extension SourceProvider.SourceItem: Equatable {}
private func == (lhs: SourceProvider.SourceItem, rhs: SourceProvider.SourceItem) -> Bool {
    return lhs.value == rhs.value && lhs.cellIdentifier == rhs.cellIdentifier
}

private class MockTableView: UITableView {
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

class TableViewProtocolsTests: XCTestCase {
    func testItemsProvidingAndTableViewDataSourceExtension() {
        let dataSourceProxy = TableViewDataSource(SourceProvider())
        let tableView = UITableView()
        
        XCTAssertEqual(dataSourceProxy.numberOfSections(in: tableView), 1)
        XCTAssertEqual(dataSourceProxy.tableView(tableView, numberOfRowsInSection: 0), dataSourceProxy.item.data.count)
        XCTAssertEqual(dataSourceProxy.tableView(tableView, titleForFooterInSection: 0), nil)
        XCTAssertEqual(dataSourceProxy.tableView(tableView, titleForHeaderInSection: 0), nil)
    }
    
    func testTableViewConfigurable() {
        let source = SourceProvider()
        let tableView = MockTableView()
        
        for (index, element) in source.data.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            source.sourceValidationCallback = { item in
                XCTAssertEqual(item, element)
            }
            _ = source.tableView(tableView, cellForRowAt: indexPath)
        }
    }
    
    func testTableViewNestedDataSource() {
        struct DataSource: DataContaining, TableViewDataSourceType, CellConfiguring {
            typealias ItemType = [Int]
            let data = [[1, 2, 3], [1, 2, 3]]
            
            func identifier(for indexPath: IndexPath) -> String { return String() }
            func configure(item: CellItem<Int, UITableViewCell>) {}
        }
        
        let dataSource = DataSource()
        let tableView = UITableView()
        
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), dataSource.data.count)
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), dataSource.data[0].count)
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 1), dataSource.data[1].count)
    }
}
