//
//  SettingsViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var resetFavoritesButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

    // MARK: - Setup

    func setupUI() {
        self.title = "Settings"
        self.resetFavoritesButton.layer.cornerRadius = 4.0
    }

    // MARK: - IBActions

    @IBAction func fireResetFavorites(_ sender: UIButton) {
        DataController.shared.cleanFavorite()
        // El object debe coincidir con lo definido en el observador
        NotificationCenter.default.post(name: Constants.kNoteNameDidFavoritesUpdated, object: nil)
    }
}
