//
//  NSLayoutConstraint+Extensions.swift
//  AboutMeSurfSummer
//
//  Created by Роман on 1.08.23.
//

import UIKit

extension NSLayoutConstraint {
    func withPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}
