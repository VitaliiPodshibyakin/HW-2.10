//
//  NetworkManager.swift
//  HW-2.10
//
//  Created by Виталий Подшибякин on 30.03.2022.
//

//protocol NetworkManagerDelegate {
//    func updateUI(_: NetworkManager, with anime: Anime)
//}
//import Foundation
//
//
//class NetworkManager {
//
//    var delegate: NetworkManagerDelegate?
//    var animes: [Anime] = []
//
//    func fetch() {
//        let urlString = "https://ghibliapi.herokuapp.com/films"
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//        do {
//            self.animes = try JSONDecoder().decode([Anime].self, from: data)
//        } catch let error {
//            print(error.localizedDescription)
//        }
//        }.resume()
//}
//}
