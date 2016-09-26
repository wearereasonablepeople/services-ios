//
//  ConfiguringProtocols.swift
//  WARPServices
//
//  Created by Oleksii on 26/09/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

protocol Configurable {
    associatedtype DataType
    func configure(with data: DataType)
}

protocol CellConfiguring {
    associatedtype CellItemType
    associatedtype CellType
    func configure(cell: CellType, for item: CellItemType)
    func identifier(for indexPath: NSIndexPath) -> String
}

extension CellConfiguring where CellType: Configurable, CellType.DataType == CellItemType {
    func configure(cell: CellType, for item: CellItemType) {
        cell.configure(with: item)
    }
}

extension TableViewDataSource where Self: CellConfiguring, Self: ItemsProviding, Self.CellItemType == Self.ItemType {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: indexPath as NSIndexPath), for: indexPath)
        
        if let cell = cell as? CellType {
            configure(cell: cell, for: item(atIndex: indexPath.row))
        }
        
        return cell
    }
}
