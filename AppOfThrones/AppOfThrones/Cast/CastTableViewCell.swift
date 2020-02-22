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

    func setCast(_ cast: Cast) {
        self.thumb.image = UIImage(named: cast.avatar ?? "")
        self.name.text = cast.fullname
        self.role.text = cast.role
        self.episodes.text = cast.episode
    }
}
