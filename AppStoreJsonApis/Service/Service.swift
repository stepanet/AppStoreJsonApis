//
//  Service.swift
//  AppStoreJsonApis
//
//  Created by Jack Sp@rroW on 28/04/2019.
//  Copyright © 2019 Jack Sp@rroW. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
        print("fetching itunes app service")
        
                let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
                guard let url = URL(string: urlString) else { return }
        
                URLSession.shared.dataTask(with: url) { (data, response, err) in
        
                    if let err = err {
                        print("failed to fetch apps:", err)
                        completion([],nil)
                        return
                    }
                    guard let data = data else { return }
        
                    do {
                         let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
        
                        completion(searchResult.results, nil)
                        //searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
                    } catch let jsonErr {
                        print("failed to decode from JSON", jsonErr)
                        completion([],jsonErr)
                    }
                }.resume()
    }
    
}
