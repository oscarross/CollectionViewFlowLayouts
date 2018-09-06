//
//  File.swift
//  collections
//
//  Created by Oskar Rosolowski on 27/08/2018.
//  Copyright © 2018 Oskar Rosolowski. All rights reserved.
//

import UIKit

enum CollectionStyle: String {
    case carousel
}

final class FlowContoller {
    
    func present(for style: CollectionStyle, viewController: UIViewController) {
        switch style {
        case .carousel:
            viewController.navigationController?.pushViewController(buildCarousel(), animated: true)
        }
    }
    
    private func buildCarousel() -> CollectionViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        
        viewController.title = "Carousel"
        viewController.collectionView.collectionViewLayout = CarouselLayout()
        
        return viewController
    }
}

