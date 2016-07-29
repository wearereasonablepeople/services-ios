//
//  HTTPMethodTypeTests.swift
//  WARPServices
//
//  Created by Oleksii on 29/07/16.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import XCTest
@testable import WARPServices

class HTTPMethodTypeTests: XCTestCase {
    
    func testMutableRequest() {
        let request = NSMutableURLRequest(URL: NSURL(string: "http://google.com")!)
        
        XCTAssertEqual(request.httpMethod, HTTP.Method.GET)
        XCTAssertEqual(request.HTTPMethod, HTTP.Method.GET.rawValue)
        
        request.httpMethod = .POST
        XCTAssertNotEqual(request.httpMethod, HTTP.Method.GET)
        XCTAssertEqual(request.httpMethod, HTTP.Method.POST)
        XCTAssertEqual(request.HTTPMethod, HTTP.Method.POST.rawValue)
        
        request.HTTPMethod = "PUT"
        XCTAssertNotEqual(request.httpMethod, HTTP.Method.POST)
        XCTAssertEqual(request.httpMethod, HTTP.Method.PUT)
        XCTAssertEqual(request.HTTPMethod, HTTP.Method.PUT.rawValue)
    }

}
