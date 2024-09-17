//
//  File.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import Foundation

struct ListMealsResponse: Equatable {
    let meals: [MealSummary]
}

extension ListMealsResponse {
    struct DTO: Codable {
        let meals: [MealSummary.DTO]
    }
    
    init (from dto: DTO) {
        meals = dto.meals.compactMap(MealSummary.init)
    }
}
