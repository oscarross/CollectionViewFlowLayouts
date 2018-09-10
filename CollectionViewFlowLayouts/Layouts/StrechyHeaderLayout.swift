//
//  StrechyHeaderLayout.swift
//  CollectionViewFlowLayouts
//
//  Created by Oskar Rosolowski on 07.09.2018.
//  Copyright © 2018 Oskar Rosolowski. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let layoutAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
        
        let offset = collectionView!.contentOffset
        if offset.y < 0 {
            let deltaY = abs(offset.y)
            
            for itemAttributes in layoutAttributes {
                if isHeader(itemAttributes) {
                    var frame = itemAttributes.frame
                    frame.size.height = max(0, headerReferenceSize.height + deltaY)
                    frame.origin.y = frame.minY - deltaY
                    itemAttributes.frame = frame
                }
            }
        }
        
        return layoutAttributes
    }
    
    private func isHeader(_ itemAttributes: UICollectionViewLayoutAttributes) -> Bool {
        if let elementKind = itemAttributes.representedElementKind, elementKind == UICollectionView.elementKindSectionHeader {
            return true
        } else {
            return false
        }
    }
}
