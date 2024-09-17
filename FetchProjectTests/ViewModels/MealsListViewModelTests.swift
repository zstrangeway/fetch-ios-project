//
//  MealsListViewModelTests.swift
//  FetchProjectTests
//
//  Created by Zachary Strangeway on 9/15/24.
//

import XCTest
@testable import FetchProject

final class MealsListViewModelTests: XCTestCase {
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
    
    @MainActor func test_MealListViewModel_meals_shouldBeEmpty() throws {
        // Given
        
        // When
        let vm = MealListViewModel(mealsApiService: mockMealsApiService, loggingService: mockLoggingService)
        
        // Then
        XCTAssertTrue(vm.meals.isEmpty)
    }
    
    @MainActor func test_MealListViewModel_meals_shouldBeInjected() throws {
        // Given
        let meals = MockMealData.generateMealSummary(1)
        
        // When
        let vm = MealListViewModel(meals: meals, mealsApiService: mockMealsApiService, loggingService: mockLoggingService)
        
        // Then
        XCTAssertEqual(vm.meals, meals)
        XCTAssertEqual(vm.meals.count, 1)
    }
    
    @MainActor func test_MealListViewModel_loadMeals_shouldLoadMeals() async throws {
        // Given
        let vm = MealListViewModel(mealsApiService: mockMealsApiService, loggingService: mockLoggingService)
        let meals = MockMealData.generateMealSummary(1)
        mockMealsApiService.listMealsResponse = ListMealsResponse(meals: meals)
        
        // When
        await vm.loadMeals()
        
        // Then
        XCTAssertEqual(vm.meals, meals)
    }
    
    @MainActor func test_MealListViewModel_loadMeals_shouldLoadMeals_stress() async throws {
        // Given
        let vm = MealListViewModel(mealsApiService: mockMealsApiService, loggingService: mockLoggingService)
        let meals = MockMealData.generateMealSummary(Int.random(in: 10..<100))
        mockMealsApiService.listMealsResponse = ListMealsResponse(meals: meals)
        
        // When
        await vm.loadMeals()
        
        // Then
        XCTAssertEqual(vm.meals, meals)
    }
    
    @MainActor func test_MealListViewModel_loadMeals_shouldLogError() async throws {
        // Given
        let vm = MealListViewModel(mealsApiService: mockMealsApiService, loggingService: mockLoggingService)
        mockMealsApiService.listMealsResponse = nil
        
        // When
        await vm.loadMeals()
        
        // Then
        XCTAssertTrue(mockLoggingService.loggedMessages.count == 1)
        XCTAssertEqual(mockLoggingService.loggedMessages[0].message, "Failed to load meals")
        XCTAssertNotNil(mockLoggingService.loggedMessages[0].stack)
    }
}
