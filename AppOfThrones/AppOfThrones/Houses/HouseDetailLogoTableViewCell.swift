//
//  HouseDetailLogoTableViewCell.swift
//  AppOfThrones
//
//  Created by Jorge on 23/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class HouseDetailLogoTableViewCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }

    // MARK: - Setup

    func setupUI() {
        self.logo.layer.cornerRadius = 4.0
        self.logo.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.logo.layer.borderWidth = 1.0
    }
    
    // MARK: - Public functions

    func setImageName(_ name: String?) {
        self.logo.image = UIImage(named: name ?? "")
    }

}
