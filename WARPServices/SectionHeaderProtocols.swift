//
//  SectionHeaderProtocols.swift
//  WARPServices
//
//  Created by Oleksii on 28/11/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

public protocol HeaderTitleProvider {
    var headerTitle: String? { get }
}

public protocol FooterTitleProvider {
    var footerTitle: String? { get }
}

public extension HeaderTitleProvider {
    public var headerTitle: String? { return nil }
}

public extension FooterTitleProvider {
    public var footerTitle: String? { return nil }
}

public extension TableViewDataSource where Self: ItemsProviding, Self.ItemType: HeaderTitleProvider {
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return item(at: section).headerTitle
    }
}

public extension TableViewDataSource where Self: ItemsProviding, Self.ItemType: FooterTitleProvider {
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return item(at: section).footerTitle
    }
}