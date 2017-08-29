//
//  PickerViewDataSourceExtensions.swift
//  WARPServices
//
//  Created by Oleksii on 15/02/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import Foundation

public extension PickerViewDataSourceType where Self: ItemsProviding {
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfElements
    }
}

public extension PickerViewDataSourceType where Self: ItemsProviding, Self.DataType: ItemsProviding {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfElements
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return item(at: component).numberOfElements
    }
}
