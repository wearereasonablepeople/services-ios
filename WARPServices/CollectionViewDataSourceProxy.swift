//
//  CollectionViewDataSourceProxy.swift
//  WARPServices
//
//  Created by Oleksii on 11/02/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import UIKit

public protocol CollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func numberOfSections(in collectionView: UICollectionView) -> Int
}

public extension CollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

public final class CollectionViewDataSourceProxy<T: CollectionViewDataSource>: NSObject, UICollectionViewDataSource {
    public var dataSource: T
    
    public init(dataSource: T) {
        self.dataSource = dataSource
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return dataSource.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.numberOfSections(in: collectionView)
    }
}
