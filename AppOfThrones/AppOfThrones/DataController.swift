//
//  DataController.swift
//  AppOfThrones
//
//  Created by Jorge on 22/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

protocol FavoriteDelegate {
    func didFavoriteChanged()
}

protocol Identifiable {
    var id: Int { get }
}

class DataController {

    // Definición mínima de un singleton
    static let shared = DataController()
    // Con esto se evita que nadie lo inicialice desde fuera de la propia clase
    private init() {}

    // Private para evitar injerencias externas
    private var rating: [Rating] = []
    // Para no extender mucho el ejercicio se adopta por Int en vez de algo más elaborado
    // se guarda el id del personaje
    private var favorite: [Int] = []

    // MARK: - Favorite

    func isFavorite<T: Identifiable>(_ value: T) -> Bool {
        return favorite.contains(value.id)
    }

    func addFavorite<T: Identifiable>(_ value: T) {
        if self.isFavorite(value) == false {
            favorite.append(value.id)
        }
    }

    func removeFavorite<T: Identifiable>(_ value: T) {
        if let index = favorite.firstIndex(of: value.id) {
            favorite.remove(at: index)
        }
    }

    func cleanFavorite() {
        favorite.removeAll() // o también favorite = []
    }

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

    func cleanRate() {
        rating.removeAll() // o también favorite = []
    }

}
