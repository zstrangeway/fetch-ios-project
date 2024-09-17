//
//  MealSummary.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import Foundation

struct MealSummary: Identifiable, Hashable {
    let id: String
    let name: String
    let thumbUrl: URL?
}

extension MealSummary {
    struct DTO: Codable {
        let idMeal: String
        let strMeal: String
        let strMealThumb: String
    }

    init(from dto: DTO) {
        id = dto.idMeal
        name = dto.strMeal
        thumbUrl = URL(string: dto.strMealThumb)
    }
}
