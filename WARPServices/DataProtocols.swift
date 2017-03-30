//
//  DataProtocols.swift
//  WARPServices
//
//  Created by Oleksii on 26/09/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

public protocol DataContaining {
    associatedtype DataType
    var data: [Self.DataType] { get }
}

public protocol ItemsProviding {
    associatedtype ItemType
    var numberOfItems: Int { get }
    func item(at index: Int) -> ItemType
}

public protocol CellIdentifierProvider {
    associatedtype CellIdentifier
    var cellIdentifier: CellIdentifier { get }
}

extension Array: ItemsProviding {
    public var numberOfItems: Int { return count }
    public func item(at index: Int) -> Element {
        return self[index]
    }
}

public extension ItemsProviding where Self: DataContaining, Self.DataType == Self.ItemType {
    public var numberOfItems: Int {
        return data.count
    }
    
    public func item(at index: Int) -> ItemType {
        return data[index]
    }
}

public extension TableViewDataSource where Self: ItemsProviding {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems
    }
}

public extension TableViewDataSource where Self: ItemsProviding, Self.ItemType: ItemsProviding {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfItems
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item(at: section).numberOfItems
    }
}

public extension CollectionViewDataSource where Self: ItemsProviding {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
}

public extension CollectionViewDataSource where Self: ItemsProviding, Self.ItemType: ItemsProviding {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfItems
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item(at: section).numberOfItems
    }
}

public extension CellProviderType where Self: DataContaining, Self: CellHandlerType, Self.DataType: CellIdentifierProvider, Self.DataType.CellIdentifier == CellIdentifier {
    public func identifier(for indexPath: IndexPath) -> CellIdentifier {
        return data[indexPath.row].cellIdentifier
    }
}

