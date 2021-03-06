//
//  CellItem.swift
//  WARPServices
//
//  Created by Oleksii on 31/03/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import UIKit

public struct CellItem<T, C> {
    public let cell: C
    public let item: T
    public let indexPath: IndexPath
    
    public init(item: T, cell: C, at indexPath: IndexPath) {
        self.cell = cell
        self.item = item
        self.indexPath = indexPath
    }
    
    public func map<E>(_ transform: (T) -> E) -> CellItem<E, C> {
        return CellItem<E, C>(item: transform(item), cell: cell, at: indexPath)
    }
    
    public func mapCell<E>(to: E.Type) -> CellItem<T, E> {
        return CellItem<T, E>(item: item, cell: cell as! E, at: indexPath)
    }
}

public extension CellItem where T: Equatable, C: Equatable {
    public static func == (lhs: CellItem, rhs: CellItem) -> Bool {
        return lhs.cell == rhs.cell && lhs.item == rhs.item && lhs.indexPath == rhs.indexPath
    }
}

public extension CellItem where C: Configurable, C.DataType == T {
    public func configure() {
        cell.configure(with: item)
    }
}
