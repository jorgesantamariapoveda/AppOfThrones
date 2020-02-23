//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RateViewControllerDelegate, FavoriteDelegate {

    @IBOutlet weak var tableView: UITableView!

    var episodes: [Episode] = []

    deinit {
        // Si no se hace esto puede caerse la app
        NotificationCenter.default.removeObserver(self, name: Constants.kNoteNameDidFavoritesUpdated, object: nil)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setupNotifications()
        self.setupData()
    }

    // MARK: - Setups

    func setupUI() {
        self.title = "Episode"

        let nib = UINib(nibName: "EpisodeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func setupNotifications() {
        // En vez de crear uno específico se puede usar el que hay por defecto
        //let noteName = Notification.Name.init("DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: Constants.kNoteNameDidFavoritesUpdated, object: nil)
    }

    func setupData() {
        if let pathURL = Bundle.main.url(forResource: "season_1", withExtension: "json") {
            let data = try! Data.init(contentsOf: pathURL)
            let decoder = JSONDecoder.init()
            episodes = try! decoder.decode([Episode].self, from: data)
            self.tableView.reloadData()
        }
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
            cell.delegate = self
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

    // MARK: - FavoriteDelegate

    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
    }
}
