//
//  SettingsViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var cleanFavoritesButton: UIButton!
    @IBOutlet weak var cleanRateButtton: UIButton!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

    // MARK: - Setup

    func setupUI() {
        self.title = "Settings"
        self.cleanFavoritesButton.layer.cornerRadius = 4.0
        self.cleanRateButtton.layer.cornerRadius = 4.0
    }

    // MARK: - IBActions

    @IBAction func fireCleanFavorites(_ sender: UIButton) {
        DataController.shared.cleanFavorite()
        // El object debe coincidir con lo definido en el observador
        NotificationCenter.default.post(name: Constants.kNoteNameDidFavoritesUpdated, object: nil)
    }
    
    @IBAction func fireCleanRate(_ sender: UIButton) {
        DataController.shared.cleanRate()
        // El object debe coincidir con lo definido en el observador
        NotificationCenter.default.post(name: Constants.kNoteNameDidRateUpdated, object: nil)
    }
}
