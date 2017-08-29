//
//  PickerViewDataSourceTests.swift
//  WARPServices
//
//  Created by Oleksii on 29/08/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import XCTest
import UIKit
import WARPServices

class PickerViewDataSourceTests: XCTestCase {
    let pickerView = UIPickerView()
    
    func testPlainDataSource() {
        struct DataSource: DataContaining, PickerViewDataSourceType {
            let data = [1, 2, 3, 4]
        }
        
        let dataSource = PickerViewDataSource(dataSource: DataSource())
        XCTAssertEqual(dataSource.numberOfComponents(in: pickerView), 1)
        XCTAssertEqual(dataSource.pickerView(pickerView, numberOfRowsInComponent: 0), 4)
    }
    
    func testNestedDataSource() {
        struct DataSource: DataContaining, PickerViewDataSourceType {
            let data = [[1, 2, 3, 4], [1, 2]]
        }
        
        let dataSource = PickerViewDataSource(dataSource: DataSource())
        XCTAssertEqual(dataSource.numberOfComponents(in: pickerView), 2)
        XCTAssertEqual(dataSource.pickerView(pickerView, numberOfRowsInComponent: 0), 4)
        XCTAssertEqual(dataSource.pickerView(pickerView, numberOfRowsInComponent: 1), 2)
    }
    
}
