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
    

    
    fileprivate func fetchITunesApps() {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            if let err = err {
                print("failed to fetch apps:", err)
                return
            }
            //sucess
//            print(data)
//            print(String(data: data!, encoding: .utf8))
            
            guard let data = data else { return }
            
            do {
                 let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
            } catch let jsonErr {
                print("failed to decode from JSON", jsonErr)
            }
            
           
            
        }.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.nameLabel.text = "HERE IS MY APP NAME"
        cell.categoryLabel.text = "XXX"
        cell.ratingsLabel.text = "10.2M"
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
