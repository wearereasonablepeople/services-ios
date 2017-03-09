//
//  TableViewUpdate.swift
//  WARPServices
//
//  Created by Oleksii on 09/03/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import UIKit

public extension UITableView {
    public enum Update {
        case reload
        case update(IndexPathSet)
    }
    
    public func update(at update: Update, with animation: UITableViewRowAnimation) {
        switch update {
        case .reload:
            reloadData()
        case let .update(pathSet):
            deleteRows(at: Array(pathSet.deleted), with: animation)
            reloadRows(at: Array(pathSet.updated), with: animation)
            insertRows(at: Array(pathSet.inserted), with: animation)
        }
    }
}
