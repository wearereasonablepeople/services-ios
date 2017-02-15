//
//  PickerViewDataSourceExtensions.swift
//  WARPServices
//
//  Created by Oleksii on 15/02/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import Foundation

public extension PickerViewDataSource where Self: ItemsProviding {
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfItems
    }
}

public extension PickerViewDataSource where Self: ItemsProviding, Self.ItemType: ItemsProviding {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfItems
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return item(at: component).numberOfItems
    }
}
