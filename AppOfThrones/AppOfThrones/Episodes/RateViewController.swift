//
//  RateViewController.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

protocol RateViewControllerDelegate {
    func didRateChangued()
}

class RateViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var rateSlider: UISlider!
    @IBOutlet weak var acceptButton: UIButton!

    private var episode: Episode?
    var delegate: RateViewControllerDelegate?

    convenience init(withEpisode episode: Episode) {
        self.init()
        self.episode = episode
        self.title = episode.name
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }

    // MARK: - Setups

    func setupUI() {
        self.acceptButton.layer.cornerRadius = 4.0
        self.image.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.image.layer.borderWidth = 1.0
        self.image.layer.cornerRadius = 4.0

        if let nameImage = episode?.image {
            self.image.image = UIImage.init(named: nameImage)
        }
    }

    // MARK: - IBActions

    @IBAction func fireClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func fireAccept(_ sender: UIButton) {
        let rate = Double(Int(self.rateSlider.value * 5)/10)
        if let episode = self.episode {
            DataController.shared.rateEpisode(episode, value: rate)
        }
        self.delegate?.didRateChangued()
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func fireSlider(_ sender: UISlider) {
        self.setRating(Double(sender.value))
    }

    // MARK: - Rating

    func setRating(_ rating: Double) {
        let rate = Double(Int((rating * 5)/10))
        self.score.text = String(rate)

        self.setStarImage(star01, rating: rate, position: 0)
        self.setStarImage(star02, rating: rate, position: 1)
        self.setStarImage(star03, rating: rate, position: 2)
        self.setStarImage(star04, rating: rate, position: 3)
        self.setStarImage(star05, rating: rate, position: 4)
    }

    func setStarImage(_ imageView: UIImageView, rating: Double, position: Int) {
        let posicionDouble = Double(position * 2)
        if rating >= posicionDouble + 1.0 && rating < posicionDouble + 2.0 {
            imageView.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if rating >= (posicionDouble) {
            imageView.image = UIImage.init(systemName: "star.fill")
        } else {
            imageView.image = UIImage.init(systemName: "star")
        }
    }

}
