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
            // TODO: loading state
            let response = try await mealsApiService.getMeal(withId: mealId)
            if !response.meals.isEmpty {
                meal = response.meals[0]
            } else {
                meal = nil
                // TODO: Need some sort of meal not found state?
            }
        } catch let error {
            loggingService.debug("Failed to load mealId: \(mealId)", stack: error)
            // TODO: Display some sort of error to user
        }
    }
}
