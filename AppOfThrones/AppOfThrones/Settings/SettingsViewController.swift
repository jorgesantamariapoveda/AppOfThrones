//
//  SettingsViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

    // MARK: - Setup

    func setupUI() {
        self.title = "Settings"
        self.view.backgroundColor = UIColor.purple
    }

}
