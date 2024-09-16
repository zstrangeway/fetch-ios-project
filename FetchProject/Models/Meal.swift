//
//  Meal.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import Foundation

struct Meal {
    let id: String
    let name: String
    let thumbUrl: URL?
    let category: String
    let area: String
    let instructions: String
    let ingredients: [Ingredient]
}
