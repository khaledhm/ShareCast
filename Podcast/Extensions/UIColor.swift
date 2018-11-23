//
//  UIColor.swift
//  Podcast
//
//  Created by MacBook on 23/11/2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    var hexString:String? {
        if let components = self.cgColor.components {
            let r = components[0]
            let g = components[1]
            let b = components[2]
            return  String(format: "%02X%02X%02X", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }
        return nil
    }
}
