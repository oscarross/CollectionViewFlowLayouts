//
//  File.swift
//  collections
//
//  Created by Oskar Rosolowski on 27/08/2018.
//  Copyright © 2018 Oskar Rosolowski. All rights reserved.
//

import UIKit

enum CollectionStyle: String {
    case carousel = "Carousel"
    case stretchyHeader = "Stretchy Header"
    case horizontalCarousel = "Horizontal Carousel"
}

final class FlowContoller {
    func present(for style: CollectionStyle, viewController: UIViewController) {
        switch style {
        case .carousel:
            viewController.navigationController?.pushViewController(buildCarousel(), animated: true)
        case .stretchyHeader:
            viewController.navigationController?.pushViewController(buildStetchyHeader(), animated: true)
        case .horizontalCarousel:
            viewController.navigationController?.pushViewController(buildHorizontalCarousel(), animated: true)
        }
    }
    
    private func buildCarousel() -> CollectionViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        
        viewController.title = "Carousel"
        viewController.collectionView.collectionViewLayout = CarouselLayout()
        
        return viewController
    }
    
    private func buildHorizontalCarousel() -> CollectionViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        
        viewController.title = "Horizontal Carousel"
        viewController.collectionView.collectionViewLayout = HorizontalCarouselLayout()
        
        return viewController
    }
    
    private func buildStetchyHeader() -> StrechyHeaderViewController {
        let viewController = StrechyHeaderViewController()
        
        viewController.title = "Strechy Header"
        
        return viewController
    }
}
