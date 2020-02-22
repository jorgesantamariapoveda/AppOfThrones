//
//  CastViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var casting: [Cast] = [
                        Cast(id: 1, avatar: nil, fullname: "fullname1", role: "rol1", episode: "1", birth: "1980", placeBirth: "Alicante"),
                        Cast(id: 2, avatar: nil, fullname: "fullname2", role: "rol2", episode: "2", birth: "1990", placeBirth: "Valencia"),
                        Cast(id: 3, avatar: nil, fullname: "fullname3", role: "rol3", episode: "3", birth: "2000", placeBirth: "Castellón"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

    // MARK: - Setups

    func setupUI() {
        self.title = "Cast"

        let nib = UINib(nibName: "CastTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return casting.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as? CastTableViewCell {
            let cast = casting[indexPath.row]
            cell.setCast(cast)
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

}
