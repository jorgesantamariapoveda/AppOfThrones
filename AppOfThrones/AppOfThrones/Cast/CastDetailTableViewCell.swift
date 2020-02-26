//
//  CastDetailTableViewCell.swift
//  AppOfThrones
//
//  Created by Jorge on 24/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class CastDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var placeBirth: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public functions

    func setCast(_ cast: Cast?) {
        if let actor = cast {
            self.name.text = actor.fullname
            self.role.text = actor.description
            self.birthDate.text = actor.birth
            self.placeBirth.text = actor.placeBirth
        } else {
            self.name.text = Constants.kTextIndefined
            self.role.text = Constants.kTextIndefined
            self.birthDate.text = Constants.kTextIndefined
            self.placeBirth.text = Constants.kTextIndefined
        }
    }

}
