//
//  ColorExtension.swift
//  WARPServices
//
//  Created by Oleksii on 08/09/16.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

public extension UIColor {
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
}
