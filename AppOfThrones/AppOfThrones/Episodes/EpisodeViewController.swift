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
        NotificationCenter.default.removeObserver(self, name: Constants.kNoteNameDidRateUpdated, object: nil)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setupNotifications()
        self.setupData(1)
    }

    // MARK: - Setups

    func setupUI() {
        self.title = "Episode"

        let nib = UINib(nibName: "EpisodeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.separatorStyle = .none
    }

    func setupNotifications() {
        // En vez de crear uno específico se puede usar el que hay por defecto
        //let noteName = Notification.Name.init("DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: Constants.kNoteNameDidFavoritesUpdated, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRateChangued), name: Constants.kNoteNameDidRateUpdated, object: nil)
    }

    func setupData(_ seasonNumber: Int) {
        if let pathURL = Bundle.main.url(forResource: "season_\(seasonNumber)", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder.init()
                episodes = try decoder.decode([Episode].self, from: data)
                self.tableView.reloadData()
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("☠️ JSON-Episode")
        }
    }

    // MARK: - IBAction

    @IBAction func fireSlider(_ sender: UISegmentedControl) {
        self.setupData(sender.selectedSegmentIndex + 1)
    }

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
        fatalError("☠️ Cell-Episode")
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = episodes[indexPath.row]
        let episodeDetailViewController = EpisodeDetailViewController()
        episodeDetailViewController.setEpisode(episode)
        self.navigationController?.pushViewController(episodeDetailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - EpisodeRateViewControllerDelegate

    @objc func didRateChangued() {
        self.tableView.reloadData()
    }

    // MARK: - FavoriteDelegate

    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
    }
}
