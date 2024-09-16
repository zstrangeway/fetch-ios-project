//
//  Meal.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import Foundation

struct Meal: Equatable {
    let id: String
    let name: String
    let thumbUrl: URL?
    let category: String
    let area: String
    let instructions: String
    let ingredients: [Ingredient]
    
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.thumbUrl == rhs.thumbUrl &&
            lhs.category == rhs.category &&
            lhs.area == rhs.area &&
            lhs.instructions == rhs.instructions &&
            lhs.ingredients == rhs.ingredients
    }
}
