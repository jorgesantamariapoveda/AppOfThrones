//
//  HouseViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var houses: [House] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setupData()
    }

    // MARK: - Setups

    func setupUI() {
        self.title = "Houses"

        let nib = UINib(nibName: "HouseTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "HouseTableViewCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func setupData() {
        if let pathURL = Bundle.main.url(forResource: "houses", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder.init()
                houses = try decoder.decode([House].self, from: data)
                self.tableView.reloadData()
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("☠️ JSON-House")
        }
    }

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseTableViewCell", for: indexPath) as? HouseTableViewCell {
            let house = houses[indexPath.row]
            cell.setHouse(house)
            return cell
        }
        fatalError("☠️ Cell-House")
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Celda pulsada en sección \(indexPath.section) y fila \(indexPath.row)")
        let house = houses[indexPath.row]
        let houseDetailViewController = HouseDetailViewController.init(title: house.name)
        houseDetailViewController.setHouse(house)
        self.navigationController?.pushViewController(houseDetailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
