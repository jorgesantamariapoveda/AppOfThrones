//
//  EpisodeDetailTableViewCell.swift
//  AppOfThrones
//
//  Created by Jorge on 24/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class EpisodeDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeSeason: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var overview: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }

    // MARK: - Setups

    func setupUI() {
        self.overview.isEditable = false
        self.overview.isSelectable = false
        self.overview.isUserInteractionEnabled = false
    }

    // MARK: - Public functions

    func setEpisode(_ episode: Episode?) {
        if let ep = episode {
            self.episodeSeason.text = "[Season \(ep.season) - Episode \(ep.episode)]"
            self.name.text = ep.name
            self.date.text = ep.date
            self.overview.text = ep.overview
        }
    }
    
}
