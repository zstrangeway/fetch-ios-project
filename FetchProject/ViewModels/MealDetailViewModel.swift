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
    @Published var isLoading: Bool = false
    var navigationTitle: String {
        if isLoading {
            return "Loading..."
        } else if let strongMeal = meal {
            return strongMeal.name
        } else {
            return "Meal not found"
        }
    }
    
    init(meal: Meal? = nil, mealsApiService: MealsApiServicable, loggingService: LoggingServicable, isLoading: Bool = false) {
        self.mealsApiService = mealsApiService
        self.loggingService = loggingService
        self.meal = meal
        self.isLoading = isLoading
    }
    
    func loadMeal(withId mealId: String) async {
        isLoading = true
        do {
            let response = try await mealsApiService.getMeal(withId: mealId)
            if !response.meals.isEmpty {
                meal = response.meals[0]
            } else {
                meal = nil
            }
        } catch let error {
            loggingService.debug("Failed to load mealId: \(mealId)", stack: error)
            // TODO: Display some sort of error to user
        }
        isLoading = false
    }
}
