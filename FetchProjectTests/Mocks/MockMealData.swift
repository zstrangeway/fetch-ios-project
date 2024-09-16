//
//  MockMealDara.swift
//  FetchProjectTests
//
//  Created by Zachary Strangeway on 9/16/24.
//

import Foundation
@testable import FetchProject

struct MockMealData {
    static func generateMeal() -> Meal {
        var ingredients: [Ingredient] = []
        
        for x in 0...Int.random(in: 0..<20){
            let ingredient = Ingredient(id: x, name: UUID().uuidString, measurement: UUID().uuidString)
            ingredients.append(ingredient)
        }
        
        return Meal(
            id: UUID().uuidString,
            name: UUID().uuidString,
            thumbUrl: URL(string: UUID().uuidString),
            category: UUID().uuidString,
            area: UUID().uuidString,
            instructions: UUID().uuidString,
            ingredients: ingredients
        )
    }
    
    static func generateMeals(_ count: Int) -> [MealSummary] {
        var mealSummaries: [MealSummary] = []
        
        for _ in (0..<count) {
            mealSummaries.append(MealSummary(id: UUID().uuidString, name: UUID().uuidString, thumbUrl: URL(string: UUID().uuidString)))
        }
        
        return mealSummaries
    }
}
