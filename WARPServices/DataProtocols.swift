//
//  DataProtocols.swift
//  WARPServices
//
//  Created by Oleksii on 26/09/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

public protocol DataContaining {
    associatedtype CollectionType: RandomAccessCollection
    associatedtype Element
    var data: CollectionType { get }
    func item(at indexPath: IndexPath) -> Element
}

public protocol CellIdentifierProvider {
    associatedtype CellIdentifier
    var cellIdentifier: CellIdentifier { get }
}

extension Array: DataContaining {
    public var data: [Element] { return self }
}

public extension DataContaining where Self.CollectionType.IndexDistance == Int, Self.CollectionType.Index == Int {
    public func item(at indexPath: IndexPath) -> CollectionType.Iterator.Element {
        return data[indexPath.row]
    }
}

public extension DataContaining where Self.CollectionType.IndexDistance == Int, Self.CollectionType.Index == Int, Self.CollectionType.Iterator.Element: DataContaining, Self.CollectionType.Iterator.Element.CollectionType.IndexDistance == Int, Self.CollectionType.Iterator.Element.CollectionType.Index == Int {
    public func item(at indexPath: IndexPath) -> Self.CollectionType.Iterator.Element.CollectionType.Iterator.Element {
        return data[indexPath.section].data[indexPath.row]
    }
}

public extension TableViewDataSourceType where Self: DataContaining, Self.CollectionType.IndexDistance == Int, Self.CollectionType.Index == Int {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

public extension TableViewDataSourceType where Self: DataContaining, Self.CollectionType.IndexDistance == Int, Self.CollectionType.Index == Int, Self.CollectionType.Iterator.Element: DataContaining, Self.CollectionType.Iterator.Element.CollectionType.IndexDistance == Int, Self.CollectionType.Iterator.Element.CollectionType.Index == Int {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].data.count
    }
}

public extension CollectionViewDataSourceType where Self: DataContaining, Self.CollectionType.IndexDistance == Int, Self.CollectionType.Index == Int {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
}

public extension CollectionViewDataSourceType where Self: DataContaining, Self.CollectionType.IndexDistance == Int, Self.CollectionType.Index == Int, Self.CollectionType.Iterator.Element: DataContaining, Self.CollectionType.Iterator.Element.CollectionType.IndexDistance == Int, Self.CollectionType.Iterator.Element.CollectionType.Index == Int {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].data.count
    }
}

public extension CellProviderType where Self: DataContaining, Self: CellHandlerType, Self.CollectionType.Iterator.Element: CellIdentifierProvider, Self.CollectionType.Iterator.Element.CellIdentifier == CellIdentifier, Self.CollectionType.IndexDistance == Int, Self.CollectionType.Index == Int {
    public func identifier(for indexPath: IndexPath) -> CellIdentifier {
        return data[indexPath.row].cellIdentifier
    }
}

