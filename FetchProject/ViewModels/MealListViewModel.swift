//
//  MealListViewModel.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/14/24.
//

import Foundation

@MainActor class MealListViewModel: ObservableObject {
    private let theMealDbApiService: TheMealDbApiServicable
    
    @Published var meals: [MealSummary] = []
    
    init(theMealDbApiService: TheMealDbApiServicable) {
        self.theMealDbApiService = theMealDbApiService
        self.meals = [];
    }
    
    func loadMeals() async {
        do {
            self.meals = try await theMealDbApiService.listMeals()
        } catch let error {
            // TODO: Properly handle error
            print("Something went wrong: \(error)")
        }
    }
}
