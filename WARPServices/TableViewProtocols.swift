//
//  TableViewProtocols.swift
//  WARPServices
//
//  Created by Oleksii on 26/09/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

// MARK: - TableView Protocols
public protocol TableViewType {
    var tableView: UITableView! { get set }
}

public protocol CellHandlerType {
    associatedtype CellIdentifier: RawRepresentable
}

public protocol CellProviderType: CellHandlerType, CellConfiguring {
    func identifier(for indexPath: IndexPath) -> CellIdentifier
}

public extension CellProviderType where Self.CellIdentifier.RawValue == String {
    public func identifier(for indexPath: IndexPath) -> String {
        return identifier(for: indexPath).rawValue
    }
}
