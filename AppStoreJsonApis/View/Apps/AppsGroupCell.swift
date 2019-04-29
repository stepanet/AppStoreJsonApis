//
//  AppsGroupCell.swift
//  AppStoreJsonApis
//
//  Created by Jack Sp@rroW on 29/04/2019.
//  Copyright © 2019 Jack Sp@rroW. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont){
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}


class AppsGroupCell: UICollectionViewCell {
    
    
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 30))
    
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .purple
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
