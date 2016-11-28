//
//  DateFormatterExtension.swift
//  WARPServices
//
//  Created by Oleksii on 28/11/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import Foundation

public extension DateFormatter {
    private static let formatter = DateFormatter()
    public class func string(from date: Date, with format: String) -> String {
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    public class func date(from string: String, with format: String) -> Date? {
        formatter.dateFormat = format
        return formatter.date(from: string)
    }
}
