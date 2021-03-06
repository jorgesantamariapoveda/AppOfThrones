//
//  CastTableViewCell.swift
//  AppOfThrones
//
//  Created by Jorge on 22/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class CastTableViewCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var episodes: UILabel!
    @IBOutlet weak var heartButton: UIButton!

    private var cast: Cast?
    var delegate: FavoriteDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupUI()
    }

    // MARK: - Setup

    func setupUI() {
        self.thumb.layer.cornerRadius = 4.0
        self.thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.thumb.layer.borderWidth = 1.0
    }

    // MARK: - Public functions

    func setCast(_ actor: Cast) {
        self.cast = actor

        self.thumb.image = UIImage(named: actor.avatar ?? "")
        self.name.text = actor.fullname
        self.role.text = actor.role
        // 🚩 Como episode es opcional se ofrece un valor alternativo
        self.episodes.text = "\(actor.episodes ?? 0) episodes"

        let heartImageNamed = DataController.shared.isFavorite(actor) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImageNamed)
        self.heartButton.setImage(heartImage, for: .normal)
    }

    // MARK: - IBActions

    @IBAction func heartFire(_ sender: Any) {
        if let actor = self.cast {
            if DataController.shared.isFavorite(actor) == true {
                DataController.shared.removeFavorite(actor)
            } else {
                DataController.shared.addFavorite(actor)
            }
            delegate?.didFavoriteChanged()
        }
    }
}
