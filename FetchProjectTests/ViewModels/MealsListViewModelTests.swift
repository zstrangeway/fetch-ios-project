//
//  MealsListViewModelTests.swift
//  FetchProjectTests
//
//  Created by Zachary Strangeway on 9/15/24.
//

import XCTest
@testable import FetchProject

final class MealsListViewModelTests: XCTestCase {
    @MainActor func test_MealListViewModel_meals_shouldBeEmpty() throws {
        // Given
        let loggingService = LoggingService()
        let mealsApiService = MockMealsApiService()
        
        // When
        let vm = MealListViewModel(mealsApiService: mealsApiService, loggingService: loggingService)
        
        // Then
        XCTAssertTrue(vm.meals.isEmpty)
    }
    
    @MainActor func test_MealListViewModel_meals_shouldBeInjected() throws {
        // Given
        let loggingService = LoggingService()
        let mealsApiService = MockMealsApiService()
        let meals = [
            MealSummary(id: UUID().uuidString, name: UUID().uuidString, thumbUrl: URL(string: UUID().uuidString))
        ]
        
        // When
        let vm = MealListViewModel(meals: meals, mealsApiService: mealsApiService, loggingService: loggingService)
        
        // Then
        XCTAssertEqual(vm.meals, meals)
    }
    
    @MainActor func test_MealListViewModel_loadMeals_shouldLoadMeals() async throws {
        // Given
        let expected: [MealSummary] = [
            MealSummary(id: UUID().uuidString, name: UUID().uuidString, thumbUrl: URL(string: UUID().uuidString))
        ]
        let loggingService = LoggingService()
        let mealsApiService = MockMealsApiService(meals: expected)
        let vm = MealListViewModel(mealsApiService: mealsApiService, loggingService: loggingService)
        
        // When
        await vm.loadMeals()
        
        // Then
        XCTAssertEqual(vm.meals, expected)
    }
    
    @MainActor func test_MealListViewModel_loadMeals_shouldLoadMeals_stress() async throws {
        // Given
        var expected: [MealSummary] = []
        
        for _ in 0...Int.random(in: 1..<100){
            let mealSummary = MealSummary(id: UUID().uuidString, name: UUID().uuidString, thumbUrl: URL(string: UUID().uuidString))
            expected.append(mealSummary)
        }
        
        let loggingService = LoggingService()
        let mealsApiService = MockMealsApiService(meals: expected)
        let vm = MealListViewModel(mealsApiService: mealsApiService, loggingService: loggingService)
        
        // When
        await vm.loadMeals()
        
        // Then
        XCTAssertEqual(vm.meals, expected)
    }
    
    @MainActor func test_MealListViewModel_loadMeals_shouldLogError() async throws {
        // Given
        let loggingService = MockLoggingService()
        let mealsApiService = MockMealsApiService(meals: nil)
        let vm = MealListViewModel(mealsApiService: mealsApiService, loggingService: loggingService)
        
        // When
        await vm.loadMeals()
        
        // Then
        XCTAssertTrue(loggingService.loggedMessages.count == 1)
        XCTAssertEqual(loggingService.loggedMessages[0].message, "Failed to load meals")
        XCTAssertNotNil(loggingService.loggedMessages[0].stack)
    }
}
