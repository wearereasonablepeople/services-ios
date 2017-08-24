//
//  CollectionViewProtocolsTests.swift
//  WARPServices
//
//  Created by Oleksii on 23/08/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
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

extension SourceProvider: CellProviderType, CollectionViewDataSourceType {
    enum CellIdentifier: String {
        case test, some
    }
    
    func configure(item: CellItem<SourceItem, UICollectionViewCell>) {
        sourceValidationCallback?(item.item)
    }
}

extension SourceProvider.SourceItem: Equatable {}
private func == (lhs: SourceProvider.SourceItem, rhs: SourceProvider.SourceItem) -> Bool {
    return lhs.value == rhs.value && lhs.cellIdentifier == rhs.cellIdentifier
}

private class MockCollectionView: UICollectionView {
    override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

class CollectionViewProtocolsTests: XCTestCase {
    
    func testItemsProvidingAndCollectionViewDataSourceExtension() {
        let dataSourceProxy = CollectionViewDataSource(SourceProvider())
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        
        XCTAssertEqual(dataSourceProxy.numberOfSections(in: collectionView), 1)
        XCTAssertEqual(dataSourceProxy.collectionView(collectionView, numberOfItemsInSection: 0), dataSourceProxy.item.data.count)
    }
    
    func testCollectionViewConfigurable() {
        let source = SourceProvider()
        let collectionView = MockCollectionView(frame: .zero, collectionViewLayout: .init())
        
        for (index, element) in source.data.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            source.sourceValidationCallback = { item in
                XCTAssertEqual(item, element)
            }
            _ = source.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }
    
    func testCollectionViewNestedDataSource() {
        struct DataSource: DataContaining, CollectionViewDataSourceType, CellConfiguring {
            typealias ItemType = [Int]
            let data = [[1, 2, 3], [1, 2, 3]]
            
            func identifier(for indexPath: IndexPath) -> String { return String() }
            func configure(item: CellItem<Int, UICollectionViewCell>) {}
        }
        
        let dataSource = DataSource()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        
        XCTAssertEqual(dataSource.numberOfSections(in: collectionView), dataSource.data.count)
        XCTAssertEqual(dataSource.collectionView(collectionView, numberOfItemsInSection: 0), dataSource.data[0].count)
        XCTAssertEqual(dataSource.collectionView(collectionView, numberOfItemsInSection: 1), dataSource.data[1].count)
    }
}
