//
//  CastDetailViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 24/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class CastDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var cast: Cast?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: - Setups

    func setupUI() {
        self.title = cast?.fullname

        let nibDetailLogo = UINib(nibName: "DetailLogoTableViewCell", bundle: nil)
        self.tableView.register(nibDetailLogo, forCellReuseIdentifier: "DetailLogoTableViewCell")

        let nibDetailHouse = UINib(nibName: "CastDetailTableViewCell", bundle: nil)
        self.tableView.register(nibDetailHouse, forCellReuseIdentifier: "CastDetailTableViewCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.separatorStyle = .none
    }

    // MARK: - Public functions

    func setCast(_ cast: Cast) {
        self.cast = cast
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
                cell.setImageName(cast?.avatar)
                return cell
            }
            fatalError("☠️ Cell-DetailLogoEpisode")
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CastDetailTableViewCell", for: indexPath) as? CastDetailTableViewCell {
                cell.setCast(cast)
                return cell
            }
            fatalError("☠️ Cell-DetailCast")
        }
        fatalError("☠️ Cell-Episode")
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 350 : 160
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }

}
