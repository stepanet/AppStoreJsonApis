//
//  AppsSearchController.swift
//  AppStoreJsonApis
//
//  Created by Jack Sp@rroW on 26/04/2019.
//  Copyright © 2019 Jack Sp@rroW. All rights reserved.
//

import UIKit


class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "id1234"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
    
        
        fetchITunesApps()
    }
    
    fileprivate var appResults = [Result]()
    
    fileprivate func fetchITunesApps() {
        
        Service.shared.fetchApps { (results, err)  in
            
            if let err = err {
                print("Failed fetch apps:", err)
                return
            }
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
        let appResult = appResults[indexPath.item]
        
        cell.nameLabel.text = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        cell.ratingsLabel.text =  "Rating: \(appResult.averageUserRating ?? 0)"
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
