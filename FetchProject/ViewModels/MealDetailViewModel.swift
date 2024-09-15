//
//  MealDetailViewModel.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/14/24.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    private let theMealDbApiService: TheMealDbApiServicable
    
    @Published var meal: Meal? = nil
    
    init(theMealDbApiService: TheMealDbApiServicable) {
        self.theMealDbApiService = theMealDbApiService
    }
    
    func loadMeal(withId mealId: String) async {
        do {
            self.meal = try await theMealDbApiService.getMeal(withId: mealId)
        } catch let error {
            // TODO: Properly handle error
            print("Something went wrong: \(error)")
        }
    }
}
