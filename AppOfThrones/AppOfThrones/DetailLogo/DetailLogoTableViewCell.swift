//
//  DetailLogoTableViewCell.swift
//  AppOfThrones
//
//  Created by Jorge on 24/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class DetailLogoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLogo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }

    // MARK: - Setup

    func setupUI() {
        self.imageLogo.layer.cornerRadius = 4.0
        self.imageLogo.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.imageLogo.layer.borderWidth = 1.0
    }

    // MARK: - Public functions

    func setImageName(_ name: String?) {
        self.imageLogo.image = UIImage(named: name ?? "")
    }
}
