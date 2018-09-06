//
//  Images.swift
//  CollectionViews
//
//  Created by Oskar Rosolowski on 27/08/2018.
//  Copyright © 2018 Oskar Rosolowski. All rights reserved.
//

import UIKit

class Mock {
    let image: UIImage
    
    init(_ image: UIImage) {
        self.image = image
    }
    
    static func load() -> [Mock] {
        var objects: [Mock] = [Mock]()
        
        for i in 0...80 {
            if let image = UIImage(named: "MOCK_\(i)") {
                let mock = Mock(image)
                objects.append(mock)
            }
        }
        
        return objects
    }
}
