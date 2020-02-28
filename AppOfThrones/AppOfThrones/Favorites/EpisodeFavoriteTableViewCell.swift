//
//  EpisodeFavoriteTableViewCell.swift
//  AppOfThrones
//
//  Created by Jorge on 28/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class EpisodeFavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var episodeSeason: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupUI()
    }

    // MARK: - Setups

    func setupUI() {
        self.thumb.layer.cornerRadius = 2.0
        self.thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.thumb.layer.borderWidth = 1.0
    }

    // MARK: - PublicFunctions

    func setEpisode(_ episode: Episode) {
        self.name.text = episode.name
        self.episodeSeason.text = episode.description
        self.thumb.image = UIImage.init(named: episode.image ?? "")
    }
}
