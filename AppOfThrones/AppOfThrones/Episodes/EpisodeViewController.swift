//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RateViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!

    var episodes: [Episode] = [
                        Episode.init(id: 1, name: "Name1", date: "Date1", image: "imagen1", episode: 1, season: 1, overview: "overview1"),
                        Episode.init(id: 2, name: "Name2", date: "Date2", image: "imagen2", episode: 2, season: 2, overview: "overview2")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }

    // MARK: - Setups

    func setupUI() {
        self.title = "Episode"

        let nib = UINib(nibName: "EpisodeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    // MARK: - IBAction
    
    //🚩
//    @IBAction func fireRate(_ sender: UIButton) {
//        let rateViewController = RateViewController()
//        //rateViewController.modalTransitionStyle = .crossDissolve
//        rateViewController.modalPresentationStyle = .fullScreen
//        self.present(rateViewController, animated: true, completion: nil)
//    }


    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            let episode = episodes[indexPath.row]
            cell.setEpisode(episode)
            cell.rateClousure = {
                let rateVC = RateViewController.init(withEpisode: episode)
                rateVC.delegate = self
                let navigationVC = UINavigationController.init(rootViewController: rateVC)
                self.present(navigationVC, animated: true, completion: nil)
            }
            return cell
        }
        fatalError("OHHHHHHHH")
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Celda pulsada en sección \(indexPath.section) y fila \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false // Se desactiva el tap
    }

    // MARK: - EpisodeRateViewControllerDelegate
    func didRateChangued() {
        self.tableView.reloadData()
    }

}
