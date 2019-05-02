//
//  AppsHeaderCell.swift
//  AppStoreJsonApis
//
//  Created by Jack Sp@rroW on 02/05/2019.
//  Copyright © 2019 Jack Sp@rroW. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    
    let company = UILabel(text: "faceBook", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "keep up with friends is faster then ever", font: .systemFont(ofSize: 20))
    let imageView = UIImageView(cornerRadius: 8)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .green
        imageView.backgroundColor = .red
        titleLabel.numberOfLines = 2
        company.textColor = .blue
        
        
        let stackView = VerticalStackView(arrangedSubviews: [company, titleLabel,imageView], spacing: 12)
        
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
