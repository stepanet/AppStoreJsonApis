//
//  SearchResult.swift
//  AppStoreJsonApis
//
//  Created by Jack Sp@rroW on 28/04/2019.
//  Copyright © 2019 Jack Sp@rroW. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
}
