//
//  MealListViewModel.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/14/24.
//

import Foundation

@MainActor class MealListViewModel: ObservableObject {
    private let mealsApiService: MealsApiServicable
    private let loggingService: LoggingServicable
    
    @Published var meals: [MealSummary] = []
    
    init(mealsApiService: MealsApiServicable, loggingService: LoggingServicable) {
        self.mealsApiService = mealsApiService
        self.loggingService = loggingService
        self.meals = [];
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
