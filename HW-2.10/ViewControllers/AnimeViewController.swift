//
//  AnimeViewController.swift
//  HW-2.10
//
//  Created by Виталий Подшибякин on 30.03.2022.
//

import UIKit

class AnimeViewController: UIViewController {

    @IBOutlet var animeTitleLabel: UILabel!
    @IBOutlet var animeOriginalTitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var animeImage: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var randomAnime: Anime?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        animeTitleLabel.text = randomAnime?.title
        animeOriginalTitleLabel.text = randomAnime?.originalTitle
        descriptionLabel.text = randomAnime?.description
    
        NetWorkManager.shared.fetchImage(from: randomAnime?.image ?? "") { image in
            self.animeImage.image = image
            self.activityIndicator.stopAnimating()
        }
    }
}
