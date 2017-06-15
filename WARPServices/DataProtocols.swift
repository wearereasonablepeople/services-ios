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
    var numberOfElements: Int { get }
    func item(at index: Int) -> CollectionType.Iterator.Element
    func item(at indexPath: IndexPath) -> Element
}

public protocol CellIdentifierProvider {
    associatedtype CellIdentifier
    var cellIdentifier: CellIdentifier { get }
}

extension Array: DataContaining {
    public var data: [Element] { return self }
}

public extension DataContaining {
    public func item(at indexPath: IndexPath) -> CollectionType.Iterator.Element {
        return item(at: indexPath.row)
    }
}

public extension DataContaining where Self.CollectionType.IndexDistance == Int {
    var numberOfElements: Int {
        return data.count
    }
}

public extension DataContaining where Self.CollectionType.IndexDistance == IntMax {
    var numberOfElements: Int {
        return Int(data.count)
    }
}

public extension DataContaining where Self.CollectionType.Index == Int {
    public func item(at index: Int) -> CollectionType.Iterator.Element {
        return data[index]
    }
}

public extension DataContaining where Self.CollectionType.Index == AnyIndex {
    public func item(at index: Int) -> CollectionType.Iterator.Element {
        return data[AnyIndex(index)]
    }
}

public extension DataContaining where Self: DataContaining, Self.CollectionType.Iterator.Element: DataContaining {
    public func item(at indexPath: IndexPath) -> Self.CollectionType.Iterator.Element.CollectionType.Iterator.Element {
        return item(at: indexPath.section).item(at: indexPath.row)
    }
}

public extension TableViewDataSourceType where Self: DataContaining {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfElements
    }
}

public extension TableViewDataSourceType where Self: DataContaining, Self.CollectionType.Iterator.Element: DataContaining {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfElements
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item(at: section).numberOfElements
    }
}

public extension CollectionViewDataSourceType where Self: DataContaining {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfElements
    }
}

public extension CollectionViewDataSourceType where Self: DataContaining, Self.CollectionType.Iterator.Element: DataContaining {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfElements
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item(at: section).numberOfElements
    }
}

public extension CellProviderType where Self: DataContaining, Self: CellHandlerType, Self.CollectionType.Iterator.Element: CellIdentifierProvider, Self.CollectionType.Iterator.Element.CellIdentifier == CellIdentifier {
    public func identifier(for indexPath: IndexPath) -> CellIdentifier {
        return item(at: indexPath.section).cellIdentifier
    }
}

