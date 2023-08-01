//
//  UIColor+Extensions.swift
//  AboutMeSurfSummer
//
//  Created by Роман on 1.08.23.
//

import UIKit.UIColor

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            red: CGFloat((hex >> 16) & 0xFF) / 255,
            green: CGFloat((hex >> 08) & 0xFF) / 255,
            blue: CGFloat((hex >> 00) & 0xFF) / 255
        )
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: 1)
    }
}
