//
//  Episode.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

// Identifiable se puede aplicar tanto en class como en struct (ver Cast.swift)
class Episode: Identifiable, Codable, CustomStringConvertible, Equatable {

    var id: Int
    var name: String?
    var date: String?
    var image: String?
    var episode: Int
    var season: Int
    var overview: String

    // MARK: - CustomStringConvertible

    var description: String {
        return "[Episode \(self.episode) - Season \(self.season)]"
    }

    // MARK: - Equatable
    
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.id == rhs.id
    }

    // MARK: - Inits

    init(id: Int, name: String?, date: String?, image: String?, episode: Int, season: Int, overview: String) {
        self.id = id
        self.name = name
        self.date = date
        self.image = image
        self.episode = episode
        self.season = season
        self.overview = overview
    }
}
