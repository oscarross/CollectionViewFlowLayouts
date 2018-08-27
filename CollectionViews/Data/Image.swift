//
//  Images.swift
//  CollectionViews
//
//  Created by oscar on 27/08/2018.
//  Copyright © 2018 rosolowski. All rights reserved.
//

import UIKit

class Image {
    let color: UIColor
    
    init(_ color: UIColor) {
        self.color = color
    }
    
    static func loadImages() -> [Image] {
        let image1 = Image(.red)
        let image2 = Image(.green)
        let image3 = Image(.black)
        let image4 = Image(.yellow)
        
        return [image1, image2, image3, image4]
    }
}
