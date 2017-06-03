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

public extension TableViewDataSourceType where Self: DataContaining, Self.CollectionType.IndexDistance == Int, Self.CollectionType.Index == Int, Self.CollectionType.Iterator.Element: HeaderTitleProvider {
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].headerTitle
    }
}

public extension TableViewDataSourceType where Self: DataContaining, Self.CollectionType.IndexDistance == Int, Self.CollectionType.Index == Int, Self.CollectionType.Iterator.Element: FooterTitleProvider {
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return data[section].footerTitle
    }
}
