//
//  MealListViewModel.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/14/24.
//

import Foundation

@MainActor class MealListViewModel: ObservableObject {
    let mealsApiService: MealsApiServicable
    let loggingService: LoggingServicable
    
    @Published var meals: [MealSummary] = []
    @Published var isLoading: Bool = false    
    
    init(meals: [MealSummary] = [], mealsApiService: MealsApiServicable, loggingService: LoggingServicable) {
        self.mealsApiService = mealsApiService
        self.loggingService = loggingService
        self.meals = meals;
    }
    
    func loadMeals() async {
        isLoading = true
        do {
            meals = try await mealsApiService.listMeals().meals
        } catch let error {
            loggingService.debug("Failed to load meals", stack: error)
            // TODO: Display some sort of error to user
        }
        isLoading = false
    }
}
