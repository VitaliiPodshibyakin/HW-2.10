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
        fetch()
    }


    @IBAction func getRandomAnime() {
    }
    
    private func fetch() {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
        do {
            self.animes = try JSONDecoder().decode([Anime].self, from: data)
        } catch let error {
            print(error.localizedDescription)
        }
        }.resume()
}
    
//     MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let animeVC = segue.destination as? AnimeViewController else { return }
        animeVC.randomAnime = animes.randomElement()
    }

}
