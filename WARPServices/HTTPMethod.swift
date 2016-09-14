//
//  HTTPMethodType.swift
//  WARPServices
//
//  Created by Oleksii on 29/07/16.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import Foundation

public struct HTTP {
    public enum Method: String {
        case OPTIONS
        case GET, HEAD, POST, PUT
        case PATCH, DELETE, TRACE, CONNECT
    }
}

public extension NSMutableURLRequest {
    var method: HTTP.Method {
        get {
            guard let method = HTTP.Method(rawValue: self.httpMethod) else {
                fatalError("HTTP Method is invalid")
            }
            return method
        }
        
        set {
            self.httpMethod = newValue.rawValue
        }
    }
}

