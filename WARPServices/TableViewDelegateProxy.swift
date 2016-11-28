//
//  TableViewDelegateProxy.swift
//  WARPServices
//
//  Created by Oleksii on 21/11/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

public protocol TableViewDelegate {
    
    // Display customization
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int)
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int)
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int)
    
    // Variable height support
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat
    
    // Section header & footer information. Views are preferred over title should you decide to provide both
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath)
    
    // Selection
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
}

public extension TableViewDelegate {
    
    // Display customization
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {}
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {}
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {}
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {}
    
    // Variable height support
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return tableView.rowHeight }
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { return tableView.sectionHeaderHeight }
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat { return tableView.sectionFooterHeight }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return tableView.estimatedSectionHeaderHeight
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return tableView.estimatedSectionFooterHeight
    }
    
    // Section header & footer information. Views are preferred over title should you decide to provide both
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { return nil }
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? { return nil }
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {}
    
    // Selection
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {}
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {}
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {}
}

public class TableViewDelegateProxy: NSObject, UITableViewDelegate {
    public weak var delegate: (AnyObject & TableViewDelegate)?
    
    // Display customization
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        delegate?.tableView(tableView, willDisplayHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        delegate?.tableView(tableView, willDisplayFooterView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        delegate?.tableView(tableView, didEndDisplayingHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        delegate?.tableView(tableView, didEndDisplayingFooterView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegate?.tableView(tableView, heightForRowAt: indexPath) ?? tableView.rowHeight
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return delegate?.tableView(tableView, heightForHeaderInSection: section) ?? tableView.sectionHeaderHeight
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return delegate?.tableView(tableView, heightForFooterInSection: section) ?? tableView.sectionFooterHeight
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegate?.tableView(tableView, estimatedHeightForRowAt: indexPath) ?? tableView.estimatedRowHeight
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return delegate?.tableView(tableView, estimatedHeightForHeaderInSection: section) ?? tableView.estimatedSectionHeaderHeight
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return delegate?.tableView(tableView, estimatedHeightForFooterInSection: section) ?? tableView.estimatedSectionFooterHeight
    }
    
    // Section header & footer information. Views are preferred over title should you decide to provide both
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return delegate?.tableView(tableView, viewForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return delegate?.tableView(tableView, viewForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        delegate?.tableView(tableView, accessoryButtonTappedForRowWith: indexPath)
    }
    
    // Selection
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, didHighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, didUnhighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, didDeselectRowAt: indexPath)
    }
}

public class TableViewDelegateStrongProxy: NSObject, UITableViewDelegate {
    public var delegate: TableViewDelegate? = nil
    
    // Display customization
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        delegate?.tableView(tableView, willDisplayHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        delegate?.tableView(tableView, willDisplayFooterView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        delegate?.tableView(tableView, didEndDisplayingHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        delegate?.tableView(tableView, didEndDisplayingFooterView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegate?.tableView(tableView, heightForRowAt: indexPath) ?? tableView.rowHeight
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return delegate?.tableView(tableView, heightForHeaderInSection: section) ?? tableView.sectionHeaderHeight
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return delegate?.tableView(tableView, heightForFooterInSection: section) ?? tableView.sectionFooterHeight
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegate?.tableView(tableView, estimatedHeightForRowAt: indexPath) ?? tableView.estimatedRowHeight
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return delegate?.tableView(tableView, estimatedHeightForHeaderInSection: section) ?? tableView.estimatedSectionHeaderHeight
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return delegate?.tableView(tableView, estimatedHeightForFooterInSection: section) ?? tableView.estimatedSectionFooterHeight
    }
    
    // Section header & footer information. Views are preferred over title should you decide to provide both
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return delegate?.tableView(tableView, viewForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return delegate?.tableView(tableView, viewForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        delegate?.tableView(tableView, accessoryButtonTappedForRowWith: indexPath)
    }
    
    // Selection
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, didHighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, didUnhighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, didDeselectRowAt: indexPath)
    }
}
