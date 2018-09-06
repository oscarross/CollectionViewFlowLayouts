//
//  CarouselLayout.swift
//  CollectionViews
//
//  Created by oscar on 07/09/2018.
//  Copyright © 2018 Oskar Rosolowski. All rights reserved.
//

import UIKit

class CarouselLayout: UICollectionViewFlowLayout {
    struct Constants {
        static let itemAlpha: CGFloat = 0.5
        static let itemScale: CGFloat = 0.5
        static let itemSize: CGSize = CGSize(width: 300, height: 300)
    }
    
    private var isSetup = false
    
    override func prepare() {
        super.prepare()
        
        if isSetup == false {
            isSetup = true
            setupCollectionView()
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        
        for itemAttributes in attributes! {
            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
            changeLayoutAttributes(itemAttributesCopy)
            
            attributesCopy.append(itemAttributesCopy)
        }
        
        return attributesCopy
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard
            let collectionView = collectionView,
            let layoutAttributes = layoutAttributesForElements(in: collectionView.bounds)
        else { return .zero }
        
        let center = collectionView.bounds.size.height / 2
        let proposedContentOffsetCenterOrigin = proposedContentOffset.y + center
        
        let closest = layoutAttributes.sorted { abs($0.center.y - proposedContentOffsetCenterOrigin) < abs($1.center.y - proposedContentOffsetCenterOrigin) }.first ?? UICollectionViewLayoutAttributes()
        
        let targetContentOffset = CGPoint(x: proposedContentOffset.x, y: floor(closest.center.y - center))
        
        return targetContentOffset
    }
    
    private func setupCollectionView() {
        guard let collectionView = collectionView else {
            isSetup = false
            return
        }
        
        itemSize = Constants.itemSize
        minimumLineSpacing = -(Constants.itemSize.height * 0.5)
        
        collectionView.decelerationRate = .fast
        
        let collectionSize = collectionView.bounds.size
        let yInset = (collectionSize.height - itemSize.height) / 2
        let xInset = (collectionSize.width - itemSize.width) / 2
        
        sectionInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)
    }
    
    private func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        guard let collectionView = collectionView else { return }
        
        let collectionCenter = collectionView.frame.size.height / 2
        let offset = collectionView.contentOffset.y
        let normalizedCenter = attributes.center.y - offset
        
        let maxDistance = itemSize.height + minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
        let ratio = (maxDistance - distance) / maxDistance
        
        let alpha = ratio * (1 - Constants.itemAlpha) + Constants.itemAlpha
        let scale = ratio * (1 - Constants.itemScale) + Constants.itemScale
        
        attributes.alpha = alpha
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
        attributes.zIndex = Int(alpha * 10)
    }
}
