//
//  File.swift
//  collections
//
//  Created by oscar on 27/08/2018.
//  Copyright © 2018 rosolowski. All rights reserved.
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
        
        return viewController
    }
}

