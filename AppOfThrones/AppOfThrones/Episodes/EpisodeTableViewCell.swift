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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupUI()
    }

    // MARK: - Setups

    func setupUI() {
        self.thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.thumb.layer.borderWidth = 1.0
        self.rateButton.layer.cornerRadius = 15.0
    }

    // MARK: - Public functions

    func setEpisode(_ episode: Episode) {
        // 🚩 Como no admite opcional el parámetro named se hace una especie de else
        self.thumb.image = UIImage(named: episode.image ?? "")
        self.title.text = episode.name
        self.date.text = episode.date
    }

}
