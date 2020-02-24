//
//  CastViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FavoriteDelegate {

    @IBOutlet weak var tableView: UITableView!

    var cast: [Cast] = []

    deinit {
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
        self.title = "Cast"

        let nib = UINib(nibName: "CastTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func setupNotifications() {
        // En vez de crear uno específico se puede usar el que hay por defecto
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: Constants.kNoteNameDidFavoritesUpdated, object: nil)
    }

    func setupData() {
        if let pathURL = Bundle.main.url(forResource: "cast", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder.init()
                cast = try decoder.decode([Cast].self, from: data)
                self.tableView.reloadData()
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("☠️ JSON-Cast")
        }
    }

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cast.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as? CastTableViewCell {
            let actor = cast[indexPath.row]
            cell.setCast(actor)
            cell.delegate = self
            return cell
        }
        fatalError("☠️ Cell-Cast")
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let actor = cast[indexPath.row]
        let castDetailViewController = CastDetailViewController()
        castDetailViewController.setCast(actor)
        self.navigationController?.pushViewController(castDetailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - FavoriteDelegate

    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
    }

}
