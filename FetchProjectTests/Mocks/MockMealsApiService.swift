//
//  MockMealsApiService.swift
//  FetchProjectTests
//
//  Created by Zachary Strangeway on 9/15/24.
//

import Foundation
@testable import FetchProject

enum MockMealsApiServiceError: Error {
    case mockNotSetUp
}

class MockMealsApiService: MealsApiServicable {
    var meals: [MealSummary]? = nil
    var meal: Meal? = nil
    
    func listMeals() async throws -> [MealSummary] {
        guard let strongMeals = meals else {
            throw MockMealsApiServiceError.mockNotSetUp
        }
        
        return strongMeals
    }
    
    func getMeal(withId mealId: String) async throws -> Meal {
        guard let strongMeal = meal else {
            throw MockMealsApiServiceError.mockNotSetUp
        }
        
        return strongMeal
    }
}
