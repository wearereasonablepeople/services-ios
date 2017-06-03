//
//  ConfiguringProtocols.swift
//  WARPServices
//
//  Created by Oleksii on 26/09/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

public protocol Configurable {
    associatedtype DataType
    func configure(with data: DataType)
}

public protocol CellConfiguring {
    associatedtype CellItemType
    associatedtype CellType
    func configure(item: CellItem<CellItemType, CellType>)
    func identifier(for indexPath: IndexPath) -> String
}

public extension CellConfiguring where CellType: Configurable, CellType.DataType == CellItemType {
    public func configure(item: CellItem<CellItemType, CellType>) {
        item.configure()
    }
}

public extension TableViewDataSourceType where Self: CellConfiguring, Self: DataContaining, Self.CellItemType == Self.Element {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: indexPath), for: indexPath)
        guard let customCell = cell as? CellType else { fatalError("Cell for of different type") }
        
        configure(item: CellItem(item: item(at: indexPath), cell: customCell, at: indexPath))
        
        return cell
    }
}

public extension CollectionViewDataSourceType where Self: CellConfiguring, Self: DataContaining, Self.CellItemType == Self.Element {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier(for: indexPath), for: indexPath)
        guard let customCell = cell as? CellType else { fatalError("Cell for of different type") }
        
        configure(item: CellItem(item: item(at: indexPath), cell: customCell, at: indexPath))
        
        return cell
    }
}
