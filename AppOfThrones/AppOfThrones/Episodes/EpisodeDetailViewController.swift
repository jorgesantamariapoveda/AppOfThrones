//
//  EpisodeDetailViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 23/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    private var episode: Episode?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: - Setups

    func setupUI() {
        self.title = episode?.name

        let nibDetailLogo = UINib(nibName: "DetailLogoTableViewCell", bundle: nil)
        self.tableView.register(nibDetailLogo, forCellReuseIdentifier: "DetailLogoTableViewCell")

        let nibDetailHouse = UINib(nibName: "EpisodeDetailTableViewCell", bundle: nil)
        self.tableView.register(nibDetailHouse, forCellReuseIdentifier: "EpisodeDetailTableViewCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    // MARK: - Public functions

    func setEpisode(_ episode: Episode) {
        self.episode = episode
    }

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailLogoTableViewCell", for: indexPath) as? DetailLogoTableViewCell {
                cell.setImageName(episode?.image)
                return cell
            }
            fatalError("☠️ Cell-DetailLogoEpisode")
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeDetailTableViewCell", for: indexPath) as? EpisodeDetailTableViewCell {
                cell.setEpisode(episode)
                return cell
            }
            fatalError("☠️ Cell-DetailEpisode")
        }
        fatalError("☠️ Cell-Episode")
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 350 : 300
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }

}
