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
    func configure(cell: CellType, for item: CellItemType)
    func identifier(for indexPath: IndexPath) -> String
}

public extension CellConfiguring where CellType: Configurable, CellType.DataType == CellItemType {
    public func configure(cell: CellType, for item: CellItemType) {
        cell.configure(with: item)
    }
}

public extension TableViewDataSource where Self: CellConfiguring, Self: ItemsProviding, Self.CellItemType == Self.ItemType {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: indexPath), for: indexPath)
        
        if let cell = cell as? CellType {
            configure(cell: cell, for: item(atIndex: indexPath.row))
        }
        
        return cell
    }
}
