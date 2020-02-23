//
//  HouseDetailViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 22/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    private var house: House?

    convenience init(title: String?) {
        self.init(nibName: "HouseDetailViewController", bundle: nil)
        self.title = title
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: - Setups

    func setupUI() {
        let nibDetailLogo = UINib(nibName: "HouseDetailLogoTableViewCell", bundle: nil)
        self.tableView.register(nibDetailLogo, forCellReuseIdentifier: "HouseDetailLogoTableViewCell")

        let nibDetailHouse = UINib(nibName: "HouseDetailTableViewCell", bundle: nil)
        self.tableView.register(nibDetailHouse, forCellReuseIdentifier: "HouseDetailTableViewCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    // MARK: - Public functions

    func setHouse(_ house: House) {
        self.house = house
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
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseDetailLogoTableViewCell", for: indexPath) as? HouseDetailLogoTableViewCell {
                cell.setImageName(house?.name)
                return cell
            }
            fatalError("☠️ Cell-DetailLogoHouse")
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseDetailTableViewCell", for: indexPath) as? HouseDetailTableViewCell {
                cell.setHouse(house)
                return cell
            }
            fatalError("☠️ Cell-DetailHouse")
        }
        fatalError("☠️ Cell-Episode")
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 374 : 130
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }

}
