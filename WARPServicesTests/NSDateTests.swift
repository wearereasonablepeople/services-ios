//
//  NSDateTests.swift
//  WARPServices
//
//  Created by Oleksii on 27/07/16.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import XCTest
@testable import WARPServices

class NSDateTests: XCTestCase {

    func testComparable() {
        XCTAssertTrue(NSDate(timeIntervalSince1970: 200) == NSDate(timeIntervalSince1970: 200))
        XCTAssertTrue(NSDate(timeIntervalSince1970: 200) <= NSDate(timeIntervalSince1970: 200))
        XCTAssertTrue(NSDate(timeIntervalSince1970: 200) >= NSDate(timeIntervalSince1970: 200))
        XCTAssertTrue(NSDate(timeIntervalSince1970: 180) < NSDate(timeIntervalSince1970: 200))
        XCTAssertTrue(NSDate(timeIntervalSince1970: 180) <= NSDate(timeIntervalSince1970: 200))
        XCTAssertTrue(NSDate(timeIntervalSince1970: 220) > NSDate(timeIntervalSince1970: 200))
        XCTAssertTrue(NSDate(timeIntervalSince1970: 220) >= NSDate(timeIntervalSince1970: 200))
    }

}
