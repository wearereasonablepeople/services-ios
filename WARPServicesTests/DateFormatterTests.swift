//
//  DateFormatterTests.swift
//  WARPServices
//
//  Created by Oleksii on 31/03/2017.
//  Copyright © 2017 Oleksii Dykan. All rights reserved.
//

import XCTest
import WARPServices

class DateFormatterTests: XCTestCase {
    
    func testDateFormatterExtension() {
        let dateFormatter = DateFormatter()
        let dateString = "03/31/2017"
        let format = "MM/dd/yyyy"
        
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: dateString)!
        
        XCTAssertEqual(date, DateFormatter.date(from: dateString, with: format))
        XCTAssertEqual(dateString, DateFormatter.string(from: date, with: format))
    }
    
}
