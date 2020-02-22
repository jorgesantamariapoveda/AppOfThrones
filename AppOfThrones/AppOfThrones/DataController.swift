//
//  DataController.swift
//  AppOfThrones
//
//  Created by Jorge on 22/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

class DataController {

    // Definición mínima de un singleton
    static let shared = DataController()
    // Con esto se evita que nadie lo inicialice desde fuera de la propia clase
    private init() {}

    // Private para evitar injerencias externas
    private var rating: [Rating] = []

    // MARK: - Rating

    func rateEpisode(_ episode: Episode, value: Double) {
        if ratingForEpisode(episode) == nil {
            let rateValue = Rating.init(id: episode.id, rate: Rate.rated(value: value))
            rating.append(rateValue)
        }
    }

    func removeRateEpisode(_ episode: Episode)  {
        if let index = self.rating.firstIndex(where: { (rating) -> Bool in
            return rating.id == episode.id
        }) {
            self.rating.remove(at: index)
        }
    }

    func ratingForEpisode(_ episode: Episode) -> Rating? {
        // Forma 1
//        let filtered = rating.filter { (rating) -> Bool in
//            if rating.id == episode.id {
//                return true
//            }
//            return false
//        }
//        if filtered.count == 0 {
//            return nil
//        } else {
//            return filtered.first!

        // Forma 2
//        let filtered = rating.filter { (rating) -> Bool in
//            if rating.id == episode.id {
//                return true
//            }
//            return false
//        }
//        return filtered.count == 0 ? nil : filtered.first!

        // Forma 3
//        let filtered = rating.filter { (rating) -> Bool in
//            return rating.id == episode.id
//        }
//        return filtered.count == 0 ? nil : filtered.first!

        // Forma 4
//        let filtered = rating.filter {
//            return $0.id == episode.id
//        }
//        return filtered.count == 0 ? nil : filtered.first!

        // Forma 5
        let filtrados = rating.filter {
            $0.id == episode.id
        }
        return filtrados.first
    }
}
