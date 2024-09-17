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
    
    static func generateMealSummary(_ count: Int) -> [MealSummary] {
        var mealSummaries: [MealSummary] = []
        
        for _ in (0..<count) {
            mealSummaries.append(MealSummary(id: UUID().uuidString, name: UUID().uuidString, thumbUrl: URL(string: UUID().uuidString)))
        }
        
        return mealSummaries
    }
    
    static func generateListMealsResponseDTO(_ count: Int) -> ListMealsResponse.DTO {
        var meals: [MealSummary.DTO] = []
        
        for _ in (0..<count) {
            meals.append(
                MealSummary.DTO(idMeal: UUID().uuidString, strMeal: UUID().uuidString, strMealThumb: UUID().uuidString)
            )
        }
        
        return ListMealsResponse.DTO(meals: meals)
    }
    
    static func generateLookupMealsResponseDTO() -> LookupMealsResponse.DTO {
        let meals: [Meal.DTO] = [
            Meal.DTO(
                idMeal: UUID().uuidString,
                strMeal: UUID().uuidString,
                strMealThumb: UUID().uuidString,
                strCategory: UUID().uuidString,
                strArea: UUID().uuidString,
                strInstructions: UUID().uuidString,
                strIngredient1: UUID().uuidString,
                strIngredient2: UUID().uuidString,
                strIngredient3: UUID().uuidString,
                strIngredient4: UUID().uuidString,
                strIngredient5: UUID().uuidString,
                strIngredient6: UUID().uuidString,
                strIngredient7: UUID().uuidString,
                strIngredient8: UUID().uuidString,
                strIngredient9: UUID().uuidString,
                strIngredient10: UUID().uuidString,
                strIngredient11: UUID().uuidString,
                strIngredient12: UUID().uuidString,
                strIngredient13: UUID().uuidString,
                strIngredient14: UUID().uuidString,
                strIngredient15: UUID().uuidString,
                strIngredient16: UUID().uuidString,
                strIngredient17: UUID().uuidString,
                strIngredient18: UUID().uuidString,
                strIngredient19: UUID().uuidString,
                strIngredient20: UUID().uuidString,
                strMeasure1: UUID().uuidString,
                strMeasure2: UUID().uuidString,
                strMeasure3: UUID().uuidString,
                strMeasure4: UUID().uuidString,
                strMeasure5: UUID().uuidString,
                strMeasure6: UUID().uuidString,
                strMeasure7: UUID().uuidString,
                strMeasure8: UUID().uuidString,
                strMeasure9: UUID().uuidString,
                strMeasure10: UUID().uuidString,
                strMeasure11: UUID().uuidString,
                strMeasure12: UUID().uuidString,
                strMeasure13: UUID().uuidString,
                strMeasure14: UUID().uuidString,
                strMeasure15: UUID().uuidString,
                strMeasure16: UUID().uuidString,
                strMeasure17: UUID().uuidString,
                strMeasure18: UUID().uuidString,
                strMeasure19: UUID().uuidString,
                strMeasure20: UUID().uuidString
            )
        ]
        
        return LookupMealsResponse.DTO(meals: meals)
    }
}
