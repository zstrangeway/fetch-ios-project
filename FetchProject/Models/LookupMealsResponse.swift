//
//  LookupMealsResponse.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import Foundation

struct LookupMealsResponse: Equatable, DecodableFromDTO {
    let meals: [Meal]
}

extension LookupMealsResponse {
    struct DTO: Codable {
        let meals: [Meal.DTO]
    }
    
    init (from dto: DTO) {
        meals = dto.meals.compactMap(Meal.init)
    }
}
