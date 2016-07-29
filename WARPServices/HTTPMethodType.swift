//
//  HTTPMethodType.swift
//  WARPServices
//
//  Created by Oleksii on 29/07/16.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import Foundation

struct HTTP {
    enum Method: String {
        case OPTIONS
        case GET, HEAD, POST, PUT
        case PATCH, DELETE, TRACE, CONNECT
    }
}

protocol HTTPMethodType {
    var httpMethod: HTTP.Method { get }
}

extension NSMutableURLRequest: HTTPMethodType {
    var httpMethod: HTTP.Method {
        get {
            guard let method = HTTP.Method(rawValue: self.HTTPMethod) else {
                fatalError("HTTP Method is invalid")
            }
            return method
        }
        
        set {
            self.HTTPMethod = newValue.rawValue
        }
    }
}

