//
//  ViewController.swift
//  HW-2.10
//
//  Created by Виталий Подшибякин on 30.03.2022.
//

import UIKit

class MainViewController: UIViewController {


    
    let urlString = "https://ghibliapi.herokuapp.com/films"
    var animes: [Anime] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
                NetWorkManager.shared.fetchData(from: urlString) { animes in
                    self.animes = animes
                }
    }


    @IBAction func getRandomAnime() {
        // при удалении крашится, не пойму почему
    }
    
//     MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let animeVC = segue.destination as? AnimeViewController else { return }
        animeVC.randomAnime = animes.randomElement()
    }

}
