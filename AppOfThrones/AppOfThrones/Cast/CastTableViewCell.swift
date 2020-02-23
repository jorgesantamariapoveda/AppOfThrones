//
//  CastTableViewCell.swift
//  AppOfThrones
//
//  Created by Jorge on 22/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

protocol CastTableViewCellDelegate {
    func didFavoriteChanged()
}

class CastTableViewCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var episodes: UILabel!
    @IBOutlet weak var heartButton: UIButton!

    private var cast: Cast?
    var delegate: CastTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupUI()
    }

    // MARK: - Setup

    func setupUI() {
        self.thumb.layer.cornerRadius = 4.0
        self.thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.thumb.layer.borderWidth = 1.0

        //...aqui mirare estado del icono del corazon, pero necesito el cast???
    }

    // MARK: - Public functions

    func setCast(_ actor: Cast) {
        self.cast = actor

        self.thumb.image = UIImage(named: actor.avatar ?? "")
        self.name.text = actor.fullname
        self.role.text = actor.role
        // 🚩 Como episode es opcional se ofrece un valor alternativo
        self.episodes.text = "\(actor.episode ?? 0) episodes"

        let heartImageNamed = DataController.shared.isFavoriteCast(actor) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImageNamed)
        self.heartButton.setImage(heartImage, for: .normal)
    }

    // MARK: - IBActions

    @IBAction func heartFire(_ sender: Any) {
        if let actor = self.cast {
            if DataController.shared.isFavoriteCast(actor) == true {
                DataController.shared.removeFavoriteCast(actor)
            } else {
                DataController.shared.addFavoriteCast(actor)
            }
            delegate?.didFavoriteChanged()
        }
    }
}
