//
//  TableViewProtocolsTests.swift
//  WARPServices
//
//  Created by Oleksii on 26/09/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import XCTest
import WARPServices

class SourceProvider: DataContaining, ItemsProviding {
    struct SourceItem: CellIdentifierProvider {
        let value: String
        let cellIdentifier: SourceProvider.CellIdentifier
    }
    typealias ItemType = SourceItem

    var sourceValidationCallback: ((SourceItem) -> Void)?
    let data: [SourceItem]? = [SourceItem(value: "Some", cellIdentifier: .some), SourceItem(value: "test", cellIdentifier: .test), SourceItem(value: "strings", cellIdentifier: .test)]
}

extension SourceProvider: CellProviderType, TableViewDataSource {
    typealias CellType = UITableViewCell
    typealias CellItemType = SourceItem
    enum CellIdentifier: String {
        case test, some
    }
    
    func configure(cell: UITableViewCell, for item: SourceItem) {
        sourceValidationCallback?(item)
    }
}

extension SourceProvider.SourceItem: Equatable {}
func == (lhs: SourceProvider.SourceItem, rhs: SourceProvider.SourceItem) -> Bool {
    return lhs.value == rhs.value && lhs.cellIdentifier == rhs.cellIdentifier
}

class MockTableView: UITableView {
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

class TableViewProtocolsTests: XCTestCase {
    func testDataContainingAndItemsProvidingExtension() {
        let source = SourceProvider()
        
        XCTAssertEqual(source.numberOfItems, source.data!.count)
        for (index, element) in source.data!.enumerated() {
            XCTAssertEqual(source.item(at: index), element)
        }
    }
    
    func testItemsProvidingAndTableViewDataSourceExtension() {
        let dataSourceProxy = TableViewDataSourceProxy(dataSource: SourceProvider())
        let tableView = UITableView()
        
        XCTAssertEqual(dataSourceProxy.numberOfSections(in: tableView), 1)
        XCTAssertEqual(dataSourceProxy.tableView(tableView, numberOfRowsInSection: 0), dataSourceProxy.dataSource.data!.count)
        XCTAssertEqual(dataSourceProxy.tableView(tableView, titleForFooterInSection: 0), nil)
        XCTAssertEqual(dataSourceProxy.tableView(tableView, titleForHeaderInSection: 0), nil)
    }
    
    func testTableViewConfigurable() {
        let source = SourceProvider()
        let tableView = MockTableView()
        
        for (index, element) in source.data!.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            source.sourceValidationCallback = { item in
                XCTAssertEqual(item, element)
            }
            _ = source.tableView(tableView, cellForRowAt: indexPath)
        }
    }
}
