//
//  CollectionViewController.swift
//  CollectionViews
//
//  Created by oscar on 27/08/2018.
//  Copyright © 2018 rosolowski. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let images = Image.loadImages()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}

extension CollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0//images.count
    }
}
