//
//  AnimeViewController.swift
//  HW-2.10
//
//  Created by Виталий Подшибякин on 30.03.2022.
//

import UIKit

class AnimeViewController: UIViewController {


    @IBOutlet var animeTitleLabel: UILabel!
    @IBOutlet var originalTitleLabel: UILabel!
    @IBOutlet var animeImage: UIImageView!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var randomAnime: Anime?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animeTitleLabel.text = randomAnime?.title
        originalTitleLabel.text = randomAnime?.original_title
        descriptionLabel.text = randomAnime?.description
        fetchImage()
    }
    
    private func fetchImage() {
        guard let url = URL(string: randomAnime?.image ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            print(response)
            
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.animeImage.image = image
            }
        }.resume()
    }
}
