//
//  AppDetailCell.swift
//  AppStoreJsonApis
//
//  Created by Jack Sp@rroW on 07/05/2019.
//  Copyright © 2019 Jack Sp@rroW. All rights reserved.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    
    var app: Result! {
        didSet {
            nameLabel.text = app?.trackName
            releaseNotesLabel.text = app?.releaseNotes
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    
    let appIconImageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "App name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    let priceButton = UIButton(title: "44.44")
    let whatsNewLabel = UILabel(text: "What's new", font: .boldSystemFont(ofSize: 20), numberOfLines: 1)
    let releaseNotesLabel = UILabel(text: "Release notes", font: .boldSystemFont(ofSize: 18), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        appIconImageView.backgroundColor = .red
        appIconImageView.constrainWidth(constant: 140)
        appIconImageView.constrainHeight(constant: 140)
        
        priceButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        priceButton.constrainHeight(constant: 32)
        priceButton.constrainWidth(constant: 80)
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
        
        
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                 appIconImageView,
                 VerticalStackView(arrangedSubviews: [
                    nameLabel,
                    UIStackView(arrangedSubviews: [priceButton, UIView()]) ,
                    UIView()
                    ], spacing: 12)
                ], customSpacing: 16),
            whatsNewLabel,
            releaseNotesLabel
            ], spacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}



extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0){
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
