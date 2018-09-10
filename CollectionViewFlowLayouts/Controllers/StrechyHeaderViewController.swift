//
//  StrechyHeaderViewController.swift
//  CollectionViewFlowLayouts
//
//  Created by Oskar Rosolowski on 07/09/2018.
//  Copyright © 2018 Oskar Rosolowski. All rights reserved.
//

import UIKit

final class StrechyHeaderViewController: UIViewController {
    private let objects = Mock.load()
    private var collectionView: UICollectionView!
    private let layout: StretchyHeaderLayout = StretchyHeaderLayout()
    
    init() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureLayout()
    }
    
    private func configureLayout() {
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerReferenceSize = CGSize(width: view.bounds.width, height: 300)
    }
    
    private func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(cellType: ImageCell.self)
        collectionView.registerHeader(cellType: ImageHeaderView.self)
        
        collectionView.dataSource = self
        
        let constraints: [NSLayoutConstraint] = [
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate(constraints)
    }
}

extension StrechyHeaderViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as ImageCell
        let mock = objects[indexPath.row]
        
        cell.configure(with: mock.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
        if kind == UICollectionView.elementKindSectionHeader {
            let reusableView = collectionView.dequeueHeader(viewType: ImageHeaderView.self, for: indexPath) as ImageHeaderView
            reusableView.backgroundImage = UIImage(named: "MOCK_0")
            reusableView.title = "LOREM IPSUM"
            
            return reusableView
        }
        
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ImageHeaderView.identifier, for: indexPath)
    }
    
}
