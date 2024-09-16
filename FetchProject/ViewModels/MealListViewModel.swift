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
    
    init(meals: [MealSummary] = [], mealsApiService: MealsApiServicable, loggingService: LoggingServicable) {
        self.mealsApiService = mealsApiService
        self.loggingService = loggingService
        self.meals = meals;
    }
    
    func loadMeals() async {
        do {
            meals = try await mealsApiService.listMeals()
        } catch let error {
            loggingService.debug("Failed to load meals", stack: error)
            // TODO: Display some sort of error to user
        }
    }
}
