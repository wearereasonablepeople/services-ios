//
//  CollectionViewDataSourceProxy.swift
//  WARPServices
//
//  Created by Oleksii on 11/02/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import UIKit

public protocol CollectionViewDataSourceType {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func numberOfSections(in collectionView: UICollectionView) -> Int
}

public extension CollectionViewDataSourceType {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

public final class CollectionViewDataSource<T: CollectionViewDataSourceType>: NSObject, UICollectionViewDataSource {
    public var item: T
    
    public init(_ item: T) {
        self.item = item
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return item.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return item.numberOfSections(in: collectionView)
    }
}
