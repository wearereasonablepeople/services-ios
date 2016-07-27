//
//  NSDateComparable.swift
//  WARPServices
//
//  Created by Oleksii on 27/07/16.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import Foundation

// MARK: - Comparable extension
public func == (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs === rhs || lhs.compare(rhs) == .OrderedSame
}

public func < (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

extension NSDate: Comparable {}
