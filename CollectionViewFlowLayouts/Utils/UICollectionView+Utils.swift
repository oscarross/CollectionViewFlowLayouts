//
//  UICollectionView+Utils.swift
//  CollectionViewFlowLayouts
//
//  Created by oscar on 10/09/2018.
//  Copyright © 2018 Oskar Rosolowski. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register(cellType: UICollectionViewCell.Type) {
        register(cellType,
                 forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func registerHeader(cellType: UICollectionReusableView.Type) {
        register(cellType, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellType.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
    
    func dequeueHeader<T: UICollectionReusableView>(viewType: UICollectionReusableView.Type, for indexPath: IndexPath) -> T {
        guard let reusableView = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: viewType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return reusableView
    }
}

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: self) + "Identifier"
    }
}
