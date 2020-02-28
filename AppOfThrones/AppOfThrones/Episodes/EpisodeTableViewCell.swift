//
//  EpisodeTableViewCell.swift
//  AppOfThrones
//
//  Created by Jorge on 22/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    @IBOutlet weak var heartButton: UIButton!

    var rateClousure: (() -> Void)?

    private var episode: Episode?
    var delegate: FavoriteDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupUI()
    }

    // MARK: - Setups

    func setupUI() {
        self.thumb.layer.cornerRadius = 2.0
        self.thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.thumb.layer.borderWidth = 1.0
        self.rateButton.layer.cornerRadius = 15.0
    }

    // MARK: - Public functions

    func setEpisode(_ episode: Episode) {
        self.episode = episode

        // 🚩 Como no admite opcional el parámetro named se hace una especie de else
        self.thumb.image = UIImage(named: episode.image ?? "")
        self.title.text = episode.name
        self.date.text = episode.date

        if let rating = DataController.shared.ratingForEpisode(episode) {
            switch rating.rate {
            case .unrated:
                self.modeRate()
            case .rated(let value):
                self.setRating(value)
            }
        } else {
            self.modeRate()
        }

        let heartImageName = DataController.shared.isFavorite(episode) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImageName)
        self.heartButton.setImage(heartImage, for: .normal)
    }

    // MARK: - IBAction

    @IBAction func fireRate(_ sender: UIButton) {
        // 🚩 Ambas soluciones funcionan
        // 1...
        if let clousure = self.rateClousure {
            clousure()
        }
        // 2...
        //self.rateClousure?()
    }

    @IBAction func fireHeart(_ sender: UIButton) {
        if let episode = self.episode {
            if DataController.shared.isFavorite(episode) == true {
                DataController.shared.removeFavorite(episode)
            } else {
                DataController.shared.addFavorite(episode)
            }
            NotificationCenter.default.post(name: Constants.kNoteNameDidFavoritesUpdated, object: nil)
            self.delegate?.didFavoriteChanged()
        }
    }

    // MARK: - Rating

    func modeRate() {
        self.rateButton.isHidden = false
        self.star01.isHidden = true
        self.star02.isHidden = true
        self.star03.isHidden = true
        self.star04.isHidden = true
        self.star05.isHidden = true
    }

    func modeStar() {
        self.rateButton.isHidden = true
        self.star01.isHidden = false
        self.star02.isHidden = false
        self.star03.isHidden = false
        self.star04.isHidden = false
        self.star05.isHidden = false
    }

    func setRating(_ rating: Double) {
        self.modeStar()
        let rate = Double(Int((rating * 5)/10))
        self.setStarImage(star01, rating: rate, position: 0)
        self.setStarImage(star02, rating: rate, position: 1)
        self.setStarImage(star03, rating: rate, position: 2)
        self.setStarImage(star04, rating: rate, position: 3)
        self.setStarImage(star05, rating: rate, position: 4)
    }

    func setStarImage(_ imageView: UIImageView, rating: Double, position: Int) {
        let posicionDouble = Double(position * 2)
        if rating >= posicionDouble + 1.0 && rating < posicionDouble + 2.0 {
            imageView.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if rating >= (posicionDouble) {
            imageView.image = UIImage.init(systemName: "star.fill")
        } else {
            imageView.image = UIImage.init(systemName: "star")
        }
    }

}
