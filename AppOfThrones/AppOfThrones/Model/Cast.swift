//
//  Cast.swift
//  AppOfThrones
//
//  Created by Jorge on 22/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

struct Cast: Identifiable, Codable, CustomStringConvertible, Equatable {

    var id: Int
    var avatar: String?
    var fullname: String?
    var role: String?
    var episodes: Int?
    var birth: String?
    var placeBirth: String?

    // MARK: - CustomStringConvertible

    var description: String {
        if let episode = self.episodes {
            if let role = self.role {
                return "\(role) (\(episode) episodes)"
            } else {
                return "\(episode) episodes"
            }
        } else if let role = self.role {
            return "\(role)"
        } else {
            return Constants.kTextIndefined
        }
    }

    // MARK: - Equatable
    
    static func == (lhs: Cast, rhs: Cast) -> Bool {
        return lhs.id == rhs.id
    }

}
