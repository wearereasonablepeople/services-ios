//
//  IndexPathSet.swift
//  WARPServices
//
//  Created by Oleksii on 09/03/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import Foundation

public struct IndexPathSet {
    public let deleted: Set<IndexPath>
    public let inserted: Set<IndexPath>
    public let updated: Set<IndexPath>
    
    public init(deleted: Set<IndexPath>, inserted: Set<IndexPath>, updated: Set<IndexPath>) {
        self.deleted = deleted
        self.inserted = inserted
        self.updated = updated
    }
    
    public init(deleted: [Int] = [], inserted: [Int] = [], updated: [Int] = []) {
        let toIndexPath: ([Int]) -> Set<IndexPath> = { indices in return Set(indices.map { IndexPath(row: $0, section: 0) } ) }
        self.init(deleted: toIndexPath(deleted), inserted: toIndexPath(inserted), updated: toIndexPath(updated))
    }
}
