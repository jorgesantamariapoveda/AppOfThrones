//
//  HouseDetailViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 22/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    convenience init(title: String?) {
        self.init(nibName: "HouseDetailViewController", bundle: nil)
        self.title = title
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
