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
        let request = NSMutableURLRequest(url: URL(string: "http://google.com")!)
        
        XCTAssertEqual(request.method, HTTP.Method.GET)
        XCTAssertEqual(request.httpMethod, HTTP.Method.GET.rawValue)
        
        request.method = .POST
        XCTAssertNotEqual(request.method, HTTP.Method.GET)
        XCTAssertEqual(request.method, HTTP.Method.POST)
        XCTAssertEqual(request.httpMethod, HTTP.Method.POST.rawValue)
        
        request.httpMethod = "PUT"
        XCTAssertNotEqual(request.method, HTTP.Method.POST)
        XCTAssertEqual(request.method, HTTP.Method.PUT)
        XCTAssertEqual(request.httpMethod, HTTP.Method.PUT.rawValue)
    }

}
