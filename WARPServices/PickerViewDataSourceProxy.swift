//
//  PickerViewDataSourceProxy.swift
//  WARPServices
//
//  Created by Oleksii on 15/02/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import UIKit

public protocol PickerViewDataSourceType {
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
}

public extension PickerViewDataSourceType {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

public final class PickerViewDataSource<T: PickerViewDataSourceType>: NSObject, UIPickerViewDataSource {
    public var dataSource: T
    
    public init(dataSource: T) {
        self.dataSource = dataSource
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dataSource.numberOfComponents(in: pickerView)
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.pickerView(pickerView, numberOfRowsInComponent: component)
    }
}
