//
//  MealDetailViewModel.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/14/24.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    private let mealsApiService: MealsApiServicable
    private let loggingService: LoggingServicable
    
    @Published var meal: Meal?
    
    init(meal: Meal? = nil, mealsApiService: MealsApiServicable, loggingService: LoggingServicable) {
        self.mealsApiService = mealsApiService
        self.loggingService = loggingService
        self.meal = meal
    }
    
    func loadMeal(withId mealId: String) async {
        do {
            meal = try await mealsApiService.getMeal(withId: mealId)
        } catch let error {
            loggingService.debug("Failed to load mealId: \(mealId)", stack: error)
            // TODO: Display some sort of error to user
        }
    }
}
