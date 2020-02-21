//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    var episodes: [Episode] = [
        Episode.init(id: 1, name: "Name1", date: "Date1", image: "imagen1", episode: 1, season: 1, overview: "overview1"),
        Episode.init(id: 2, name: "Name2", date: "Date2", image: "imagen2", episode: 2, season: 2, overview: "overview2")
    ]

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.red
    }

    // MARK: - IBAction
    
    @IBAction func fireRate(_ sender: UIButton) {
        let rateViewController = RateViewController()
        //self.present(rateViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(rateViewController, animated: true)
    }
}
