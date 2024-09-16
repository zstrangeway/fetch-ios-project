//
//  MealDetailViewModelTest.swift
//  FetchProjectTests
//
//  Created by Zachary Strangeway on 9/16/24.
//

import XCTest
@testable import FetchProject

final class MealDetailViewModelTest: XCTestCase {
    @MainActor func test_MealDetailViewModel_meal_shouldBeNil() throws {
        // Given
        let loggingService = LoggingService()
        let mealsApiService = MockMealsApiService()
        
        // When
        let vm = MealDetailViewModel(mealsApiService: mealsApiService, loggingService: loggingService)
        
        // Then
        XCTAssertNil(vm.meal)
    }
    
    @MainActor func test_MealDetailViewModel_meal_shouldBeInjected() throws {
        // Given
        let loggingService = LoggingService()
        let mealsApiService = MockMealsApiService()
        let expected = generateMeal()
        
        // When
        let vm = MealDetailViewModel(meal: expected, mealsApiService: mealsApiService, loggingService: loggingService)
        
        // Then
        XCTAssertEqual(vm.meal, expected)
    }
    
    @MainActor func test_MealDetailViewModel_loadMeal_shouldLoadMeal() async throws {
        // Given
        let expected: Meal = generateMeal()
        let loggingService = LoggingService()
        let mealsApiService = MockMealsApiService(meal: expected)
        let vm = MealDetailViewModel(mealsApiService: mealsApiService, loggingService: loggingService)
        
        // When
        await vm.loadMeal(withId: UUID().uuidString)
        
        // Then
        XCTAssertEqual(vm.meal, expected)
    }
    
    @MainActor func test_MealDetailViewModel_loadMeal_shouldLogError() async throws {
        // Given
        let loggingService = MockLoggingService()
        let mealsApiService = MockMealsApiService(meal: nil)
        let vm = MealDetailViewModel(mealsApiService: mealsApiService, loggingService: loggingService)
        
        // When
        let mealId = UUID().uuidString
        await vm.loadMeal(withId: mealId)
        
        // Then
        XCTAssertTrue(loggingService.loggedMessages.count == 1)
        XCTAssertEqual(loggingService.loggedMessages[0].message, "Failed to load mealId: \(mealId)")
        XCTAssertNotNil(loggingService.loggedMessages[0].stack)
    }
    
    private func generateMeal() -> Meal {
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
}
