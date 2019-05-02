//
//  AppsPageHeader.swift
//  AppStoreJsonApis
//
//  Created by Jack Sp@rroW on 02/05/2019.
//  Copyright © 2019 Jack Sp@rroW. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let appHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        appHorizontalController.view.backgroundColor = .purple
        addSubview(appHorizontalController.view)
        appHorizontalController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
