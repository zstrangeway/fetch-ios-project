//
//  File.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import Foundation

struct ListMealsResponse: Codable {
    private var rawMeals: [MealSummary]
    
    var meals: [MealSummary] {
        return rawMeals;
    }
    
    enum CodingKeys: String, CodingKey {
        case rawMeals = "meals"
    }
}
