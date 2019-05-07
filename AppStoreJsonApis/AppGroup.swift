//
//  AppGroup.swift
//  AppStoreJsonApis
//
//  Created by Jack Sp@rroW on 03/05/2019.
//  Copyright © 2019 Jack Sp@rroW. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
