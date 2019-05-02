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
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
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
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
           // print(String(bytes: data!, encoding: .utf8))
            
            if let err = err {
                completion(nil,err)
                return
            }
         
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                //print(appGroup.feed.results)
                appGroup.feed.results.forEach({print($0.name)})
                completion(appGroup, nil)
                
            } catch {
                //print("failed to decode:", error)
                completion(nil, error)
            }
           
        }.resume()
        
    }
    
}
