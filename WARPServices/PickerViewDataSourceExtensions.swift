//
//  PickerViewDataSourceExtensions.swift
//  WARPServices
//
//  Created by Oleksii on 15/02/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import Foundation

public extension PickerViewDataSource where Self: DataContaining, Self.CollectionType.IndexDistance == Int, Self.CollectionType.Index == Int {
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
}

public extension PickerViewDataSource where Self: DataContaining, Self.CollectionType.IndexDistance == Int, Self.CollectionType.Index == Int, Self.CollectionType.Iterator.Element: DataContaining, Self.CollectionType.Iterator.Element.CollectionType.IndexDistance == Int, Self.CollectionType.Iterator.Element.CollectionType.Index == Int {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return data.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[component].data.count
    }
}
