//
//  ViewController.swift
//  HW-2.10
//
//  Created by Виталий Подшибякин on 30.03.2022.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {


    
    let urlString = "https://ghibliapi.herokuapp.com/films"
    var animes: [Anime] = []
    

    @IBAction func getRandomAnime() {
        NetWorkManager.shared.fetchData(from: urlString) { animes in
            self.animes = animes
        }
        
    }
    
    @IBAction func getAnimeWithAlamofire() {
                alamofireFetchData()
    }
    //     MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let animeVC = segue.destination as? AnimeViewController else { return }
        animeVC.randomAnime = animes.randomElement()
    }

    
    func alamofireFetchData () {
        AF.request(urlString)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    self.animes = Anime.getAnimes(from: value)

                case .failure(let error):
                    print(error)
                }
            }
    }
}
//guard let animesData = value as? [[String: Any]] else { return }
//
//for animeData in animesData {
//    let anime = Anime(animeData: animeData)
//    self.animes.append(anime)
//let anime = Anime(title: animeData["title"] as? String ?? "",
//                  originalTitle: animeData["original_title"] as? String ?? "",
//                  image: animeData["image"] as? String ?? "",
//                  description: animeData["description"] as? String ?? "")
