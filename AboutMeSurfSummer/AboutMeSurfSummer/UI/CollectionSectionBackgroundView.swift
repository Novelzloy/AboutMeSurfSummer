//
//  CollectionBackgroundDecorationView.swift
//  AboutMeSurfSummer
//
//  Created by Роман on 1.08.23.
//

import UIKit

class CollectionBackgroundDecorationView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .init(hex: 0xFFFFFF)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
