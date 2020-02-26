//
//  Rating.swift
//  AppOfThrones
//
//  Created by Jorge on 22/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

enum Rate {
    case unrated
    case rated(value: Double)
}

struct Rating: CustomStringConvertible, Equatable {

    var id: Int
    var rate: Rate

    // MARK: - CustomStringConvertible

    var description: String {
        switch rate {
        case .unrated:
            return "Unrated"
        case .rated(let value):
            return "Rated with \(value) points"
        }
    }

    // MARK: - Equatable

    static func == (lhs: Rating, rhs: Rating) -> Bool {
        return lhs.id == rhs.id
    }

}
