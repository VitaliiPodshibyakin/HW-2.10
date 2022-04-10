//
//  NetworkManager.swift
//  HW-2.10
//
//  Created by Виталий Подшибякин on 30.03.2022.
//

import Foundation
import UIKit

class NetWorkManager {
    static let shared = NetWorkManager()
    private init() {}
    
    func fetchData(from url: String, with completion: @escaping([Anime]) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let anime = try decoder.decode([Anime].self, from: data)
            DispatchQueue.main.async {
                completion(anime)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        }.resume()
    }
    
    
        func fetchImage(from imageUrl: String, with completion: @escaping(UIImage) -> Void) {
            guard let url = URL(string: imageUrl) else { return }
    
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, let response = response else {
                    print(error?.localizedDescription ?? "No error description")
                    return
                }
    
                print(response)
    
                guard let image = UIImage(data: data) else { return }
    
                DispatchQueue.main.async {
                    completion(image)
                }
            }.resume()
        }
}

