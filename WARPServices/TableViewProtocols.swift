//
//  TableViewProtocols.swift
//  WARPServices
//
//  Created by Oleksii on 26/09/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

// MARK: - TableView Protocols

public protocol TableViewControllerType: TableViewType, TableViewDataSourceProxyType, TableViewDataSource, ItemsProviding, CellConfiguring {}

public protocol TableViewType {
    var tableView: UITableView! { get set }
}

public protocol TableViewDataSourceProxyType {
    var dataSourceProxy: TableViewDataSourceProxy { get }
}

public protocol CellHandlerType {
    associatedtype CellIdentifier: RawRepresentable
}

public protocol CellProviderType: CellHandlerType, CellConfiguring {
    func identifier(for indexPath: IndexPath) -> CellIdentifier
}

// MARK: - Extensions
public extension TableViewDataSourceProxyType where Self: TableViewType, Self: TableViewDataSource, Self: AnyObject {
    public func setupTableViewDataSource() {
        dataSourceProxy.dataSource = self
        tableView.dataSource = dataSourceProxy
    }
}

public extension CellProviderType where Self.CellIdentifier.RawValue == String {
    public func identifier(for indexPath: IndexPath) -> String {
        return identifier(for: indexPath).rawValue
    }
}
