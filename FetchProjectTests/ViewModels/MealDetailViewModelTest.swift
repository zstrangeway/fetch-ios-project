//
//  MealDetailViewModelTest.swift
//  FetchProjectTests
//
//  Created by Zachary Strangeway on 9/16/24.
//

import XCTest
@testable import FetchProject

final class MealDetailViewModelTest: XCTestCase {
    var mockLoggingService: MockLoggingService!
    var mockMealsApiService: MockMealsApiService!
    
    override func setUpWithError() throws {
        mockLoggingService = MockLoggingService()
        mockMealsApiService = MockMealsApiService()
    }

    override func tearDownWithError() throws {
        mockLoggingService = nil
        mockMealsApiService = nil
    }
    
    @MainActor func test_MealDetailViewModel_meal_shouldBeNil() throws {
        // Given
        
        // When
        let vm = MealDetailViewModel(
            mealsApiService: mockMealsApiService,
            loggingService: mockLoggingService
        )
        
        // Then
        XCTAssertNil(vm.meal)
    }
    
    @MainActor func test_MealDetailViewModel_meal_shouldBeInjected() throws {
        // Given
        let meal = MockMealData.generateMeal()
        
        // When
        let vm = MealDetailViewModel(
            meal: meal,
            mealsApiService: mockMealsApiService,
            loggingService: mockLoggingService
        )
        
        // Then
        XCTAssertEqual(vm.meal, meal)
    }
    
    @MainActor func test_MealDetailViewModel_loadMeal_shouldLoadMeal() async throws {
        // Given
        let meal = MockMealData.generateMeal()
        let vm = MealDetailViewModel(
            mealsApiService: mockMealsApiService,
            loggingService: mockLoggingService
        )
        mockMealsApiService.lookupMealsResponse = LookupMealsResponse(meals: [meal])
        
        // When
        await vm.loadMeal(withId: UUID().uuidString)
        
        // Then
        XCTAssertEqual(vm.meal, meal)
    }
    
    @MainActor func test_MealDetailViewModel_loadMeal_shouldLoadNil() async throws {
        // Given
        let meal = MockMealData.generateMeal()
        let vm = MealDetailViewModel(
            mealsApiService: mockMealsApiService,
            loggingService: mockLoggingService
        )
        mockMealsApiService.lookupMealsResponse = LookupMealsResponse(meals: [meal])
        
        // When
        await vm.loadMeal(withId: UUID().uuidString)
        
        // Then
        XCTAssertEqual(vm.meal, meal)
    }
    
    @MainActor func test_MealDetailViewModel_loadMeal_shouldLogError() async throws {
        // Given
        let vm = MealDetailViewModel(mealsApiService: mockMealsApiService, loggingService: mockLoggingService)
        mockMealsApiService.lookupMealsResponse = nil
        
        // When
        let mealId = UUID().uuidString
        await vm.loadMeal(withId: mealId)
        
        // Then
        XCTAssertTrue(mockLoggingService.loggedMessages.count == 1)
        XCTAssertEqual(mockLoggingService.loggedMessages[0].message, "Failed to load mealId: \(mealId)")
        XCTAssertNotNil(mockLoggingService.loggedMessages[0].stack)
    }
}
