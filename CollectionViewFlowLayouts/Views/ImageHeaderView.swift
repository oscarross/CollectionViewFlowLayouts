//
//  ImageHeader.swift
//  CollectionViewFlowLayouts
//
//  Created by Oskar Rosolowski on 07/09/2018.
//  Copyright © 2018 Oskar Rosolowski. All rights reserved.
//

import UIKit

class ImageHeaderView: UICollectionReusableView {
    
    static let identifier = "ImageHeaderView"
    
    private let backgroundImageView: UIImageView = UIImageView()
    private let titleLabel: UILabel = UILabel()
    
    var backgroundImage: UIImage? {
        didSet {
            backgroundImageView.image = backgroundImage
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupViewHierarchy()
        setupBackgroundImageView()
        setupTitleLabel()
    }
    
    private func setupViewHierarchy() {
        addSubview(backgroundImageView)
        addSubview(titleLabel)
    }
    
    private func setupBackgroundImageView() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        let constraints: [NSLayoutConstraint] = [
            backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .white
        titleLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        let constraints: [NSLayoutConstraint] = [
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
