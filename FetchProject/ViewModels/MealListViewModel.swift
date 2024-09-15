//
//  MealListViewModel.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/14/24.
//

import Foundation

@MainActor class MealListViewModel: ObservableObject {
    private let mealsApiService: MealsApiServicable
    
    @Published var meals: [MealSummary] = []
    
    init(mealsApiService: MealsApiServicable) {
        self.mealsApiService = mealsApiService
        self.meals = [];
    }
    
    func loadMeals() async {
        do {
            meals = try await mealsApiService.listMeals()
        } catch let error {
            // TODO: Properly handle error
            print("Something went wrong: \(error)")
        }
    }
}
