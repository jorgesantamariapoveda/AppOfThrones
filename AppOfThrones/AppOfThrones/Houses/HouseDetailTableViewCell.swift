//
//  HouseDetailTableViewCell.swift
//  AppOfThrones
//
//  Created by Jorge on 23/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class HouseDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var words: UILabel!
    @IBOutlet weak var seat: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public functions

    func setHouse(_ house: House?) {
        if let houseOk = house {
            self.name.text = houseOk.description
            self.words.text = houseOk.words
            self.seat.text = houseOk.seat
        } else {
            self.name.text = Constants.kTextIndefined
            self.words.text = Constants.kTextIndefined
            self.seat.text = Constants.kTextIndefined
        }
    }

}
