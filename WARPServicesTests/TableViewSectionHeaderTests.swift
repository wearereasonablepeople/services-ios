//
//  TableViewSectionHeaderTests.swift
//  WARPServices
//
//  Created by Oleksii on 31/03/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import XCTest
import WARPServices

extension Int: HeaderTitleProvider, FooterTitleProvider {}

class TableViewSectionHeaderTests: XCTestCase {
    let tableView = UITableView()
    
    func testSectionHeaderFooterDefaultValeus() {
        struct DataSource: DataContaining, ItemsProviding, TableViewDataSource, CellConfiguring {
            typealias ItemType = Int
            let data = [1, 2, 3]
            
            func identifier(for indexPath: IndexPath) -> String { return String() }
            func configure(item: CellItem<Int, UITableViewCell>) {}
        }
        
        let dataSource = DataSource()
        XCTAssertNil(dataSource.tableView(tableView, titleForFooterInSection: 0))
        XCTAssertNil(dataSource.tableView(tableView, titleForHeaderInSection: 0))
    }
    
    
    func testSectionHeaderFooterRealValues() {
        struct DataSource: DataContaining, ItemsProviding, TableViewDataSource, CellConfiguring {
            struct ItemType: HeaderTitleProvider, FooterTitleProvider {
                let headerTitle: String? = "header"
                let footerTitle: String? = "footer"
            }
            
            let data = [ItemType(), ItemType(), ItemType()]
            
            func identifier(for indexPath: IndexPath) -> String { return String() }
            func configure(item: CellItem<ItemType, UITableViewCell>) {}
        }
        
        let dataSource = DataSource()
        XCTAssertEqual(dataSource.tableView(tableView, titleForFooterInSection: 0), "footer")
        XCTAssertEqual(dataSource.tableView(tableView, titleForHeaderInSection: 0), "header")
    }
    
}
