//
//  House.swift
//  AppOfThrones
//
//  Created by Jorge on 22/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

struct House: Identifiable, Codable, CustomStringConvertible, Equatable {

    var id: Int
    var imageName: String?
    var name: String?
    var words: String?
    var seat: String?

    // MARK: - CustomStringConvertible

    var description: String {
        if let name = self.name {
            return "House \(name)"
        } else {
            return "Unknow house"
        }
    }

    // MARK: - Equatable

    static func == (lhs: House, rhs: House) -> Bool {
        return lhs.id == rhs.id
    }

}
