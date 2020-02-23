//
//  HouseTableViewCell.swift
//  AppOfThrones
//
//  Created by Jorge on 22/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class HouseTableViewCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lema: UILabel!
    @IBOutlet weak var localidad: UILabel!
    @IBOutlet weak var heartButton: UIButton!

    private var house: House?
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

    func setHouse(_ house: House) {
        self.house = house

        self.thumb.image = UIImage(named: house.imageName ?? "")
        self.name.text = house.name
        self.lema.text = house.words
        self.localidad.text = house.seat

        let heartImageName = DataController.shared.isFavorite(house) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImageName)
        self.heartButton.setImage(heartImage, for: .normal)
    }

    // MARK: - IBActions

    @IBAction func fireHeart(_ sender: UIButton) {
        if let house = self.house {
            if DataController.shared.isFavorite(house) == true {
                DataController.shared.removeFavorite(house)
            } else {
                DataController.shared.addFavorite(house)
            }
            self.delegate?.didFavoriteChanged()
        }
    }

}
