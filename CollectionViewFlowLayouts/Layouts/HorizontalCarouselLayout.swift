//
//  HorizontalCarousel.swift
//  CollectionViewFlowLayouts
//
//  Created by oscar on 10/09/2018.
//  Copyright © 2018 Oskar Rosolowski. All rights reserved.
//

import UIKit

class HorizontalCarouselLayout: UICollectionViewFlowLayout {
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
        guard let layoutAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
        
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        
        for itemAttributes in layoutAttributes {
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
            else {
                return .zero
        }
        
        let center = collectionView.bounds.size.width / 2
        let proposedContentOffsetCenterOrigin = proposedContentOffset.x + center
        
        let closest = layoutAttributes.sorted { abs($0.center.x - proposedContentOffsetCenterOrigin) < abs($1.center.x - proposedContentOffsetCenterOrigin) }.first ?? UICollectionViewLayoutAttributes()
        
        let targetContentOffset = CGPoint(x: floor(closest.center.x - center), y: proposedContentOffset.y)
        
        return targetContentOffset
    }
    
    private func setupCollectionView() {
        guard let collectionView = collectionView else {
            isSetup = false
            return
        }
        
        collectionView.decelerationRate = .fast
        
        scrollDirection = .horizontal
        minimumLineSpacing = -(Constants.itemSize.height * 0.2)
        itemSize = Constants.itemSize
        
        let inset = (collectionView.bounds.width - itemSize.width) / 2
        collectionView.contentInset = .init(top: 0, left: inset, bottom: 0, right: inset)
        
        let collectionSize = collectionView.bounds.size
        let yInset = (collectionSize.height - itemSize.height) / 2
        let xInset = (collectionSize.width - itemSize.width) / 2
        
        sectionInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)
    }
    
    private func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        guard let collectionView = collectionView else { return }
        
        let collectionCenter = collectionView.bounds.size.width / 2
        let offset = collectionView.contentOffset.x
        let normalizedCenter = attributes.center.x - offset
        
        let maxDistance = itemSize.width + minimumLineSpacing
        let distance = min(collectionCenter - normalizedCenter, maxDistance)
        let ratio = (maxDistance - abs(distance)) / maxDistance
        
        let alpha = ratio * (1 - Constants.itemAlpha) + Constants.itemAlpha
        let scale = ratio * (1 - Constants.itemScale) + Constants.itemScale
        attributes.alpha = alpha
        
        let angleToSet = distance / (collectionView.bounds.width / 2)
        var transform = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
        transform.m34 = 1.0 / 400
        transform = CATransform3DRotate(transform, angleToSet, 0, 1, 0)
        attributes.transform3D = transform
        attributes.zIndex = Int(alpha * 10)
    }
}
