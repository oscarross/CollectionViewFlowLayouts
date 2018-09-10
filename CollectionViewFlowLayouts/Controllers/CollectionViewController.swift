//
//  CollectionViewController.swift
//  CollectionViews
//
//  Created by Oskar Rosolowski on 27/08/2018.
//  Copyright © 2018 Oskar Rosolowski. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    let objects = Mock.load()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(cellType: ImageCell.self)
        collectionView.backgroundColor = .black
    }
}

extension CollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as ImageCell
        let mock = objects[indexPath.row]
        
        cell.configure(with: mock.image)
        cell.contentView.layer.borderWidth = 10
        cell.contentView.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
}
