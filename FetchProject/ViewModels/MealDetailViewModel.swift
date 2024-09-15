//
//  MealDetailViewModel.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/14/24.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    private let mealsApiService: MealsApiServicable
    
    @Published var meal: Meal? = nil
    
    init(mealsApiService: MealsApiServicable) {
        self.mealsApiService = mealsApiService
    }
    
    func loadMeal(withId mealId: String) async {
        do {
            meal = try await mealsApiService.getMeal(withId: mealId)
        } catch let error {
            // TODO: Properly handle error
            print("Something went wrong: \(error)")
        }
    }
}
