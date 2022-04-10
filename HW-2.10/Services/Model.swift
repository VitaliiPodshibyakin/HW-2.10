//
//  Model.swift
//  HW-2.10
//
//  Created by Виталий Подшибякин on 30.03.2022.
//

import Foundation

struct Anime: Decodable {
    
    let title: String
    let originalTitle: String
    let image: String
    let description: String
    
    init(animeData: [String: Any]) {
        title = animeData["title"] as? String ?? ""
        originalTitle = animeData["original_title"] as? String ?? ""
        image = animeData["image"] as? String ?? ""
        description = animeData["description"] as? String ?? ""
    }

    static func getAnimes(from value: Any) -> [Anime] {
        guard let animesData = value as? [[String: Any]] else { return [] }
        var animes: [Anime] = []
        for animeData in animesData {
            let anime = Anime(animeData: animeData)
            animes.append(anime)
    }
        return animes
    }
//
//    static func getCourses(from value: Any) -> [Course] {
//        guard let coursesData = value as? [[String: Any]] else { return [] }
//        return coursesData.compactMap { Course(courseData: $0) }
//    }
    
}

