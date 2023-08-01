//
//  HavingReuseIdentifier.swift
//  DOSS
//
//  Created by Роман on 6.07.23.
//

import UIKit

protocol HavingReuseIdentifier {
    static var reuseIdentifier: String { get }
}

extension HavingReuseIdentifier {
    static var reuseIdentifier: String { String(describing: self) }
}

extension UICollectionReusableView: HavingReuseIdentifier {}

extension UICollectionView {
    func registerCell<T: UICollectionViewCell & HavingReuseIdentifier>(of type: T.Type) {
        register(T.self, forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    func registerHeaderView<T: UICollectionReusableView & HavingReuseIdentifier>(of type: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.reuseIdentifier)
    }
    
    func dequeueCell<T: UICollectionViewCell & HavingReuseIdentifier>(of type: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as! T
    }
    
    func dequeueHeaderView<T: UICollectionReusableView & HavingReuseIdentifier>(of type: T.Type, for indexPath: IndexPath) -> T {
        let kind = UICollectionView.elementKindSectionHeader
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.reuseIdentifier, for: indexPath) as! T
    }
}
