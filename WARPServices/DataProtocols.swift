//
//  DataProtocols.swift
//  WARPServices
//
//  Created by Oleksii on 26/09/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

protocol DataContaining {
    associatedtype DataType
    var data: [Self.DataType] { get }
}

protocol ItemsProviding {
    associatedtype ItemType
    var numberOfItems: Int { get }
    func item(atIndex index: Int) -> ItemType
}

protocol CellIdentifierProvider {
    associatedtype CellIdentifier
    var cellIdentifier: CellIdentifier { get }
}

extension ItemsProviding where Self: DataContaining, Self.DataType == Self.ItemType {
    var numberOfItems: Int {
        return data.count
    }
    
    func item(atIndex index: Int) -> ItemType {
        return data[index]
    }
}

extension TableViewDataSource where Self: ItemsProviding {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems
    }
}

extension CellProviderType where Self: DataContaining, Self: CellHandlerType, Self.DataType: CellIdentifierProvider, Self.DataType.CellIdentifier == CellIdentifier {
    func identifier(for indexPath: NSIndexPath) -> CellIdentifier {
        return data[indexPath.row].cellIdentifier
    }
}

