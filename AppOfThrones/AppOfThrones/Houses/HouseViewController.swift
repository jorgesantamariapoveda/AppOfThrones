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

    var houses: [House] = [
                        House(imageName: "Casa1", name: "Casa1", words: "Lema1", seat: "Local1"),
                        House(imageName: "Casa2", name: "Casa2", words: "Lema2", seat: "Local2"),
                        House(imageName: "Casa3", name: "Casa3", words: "Lema3", seat: "Local3"),
                        House(imageName: "Casa4", name: "Casa4", words: "Lema4", seat: "Local4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }

    // MARK: - Setups

    func setupUI() {
        self.title = "Houses"

        let nib = UINib(nibName: "HouseTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "HouseTableViewCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self
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
        fatalError("OHHHHHHHH")
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Celda pulsada en sección \(indexPath.section) y fila \(indexPath.row)")
        let name = houses[indexPath.row].name
        let houseDetailViewController = HouseDetailViewController.init(title: name)
        self.navigationController?.pushViewController(houseDetailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
