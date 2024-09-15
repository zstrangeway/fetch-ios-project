//
//  TheMealDbApiService.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/14/24.
//

import Foundation

enum TheMealDbApiError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}

protocol TheMealDbApiServicable {
    func listMeals() async throws -> [MealSummary]
    func getMeal(withId mealId: String) async throws -> Meal
}

class TheMealDbApiService: TheMealDbApiServicable {
    func listMeals() async throws -> [MealSummary] {
        // TODO: Should move hardcoded URL to some plist/environment config
        let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: endpoint) else {
            throw TheMealDbApiError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw TheMealDbApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ListMealsResponse.self, from: data).meals
            // TODO: Filter out null/invalid elements
        } catch let error {
            print("getMeals error:", error) // TODO: Better logging
            throw TheMealDbApiError.invalidData
        }
    }
    
    func getMeal(withId mealId: String) async throws -> Meal {
        // TODO: Should move hardcoded URL to some plist/environment config
        let endpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)";
        
        guard let url = URL(string: endpoint) else {
            throw TheMealDbApiError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw TheMealDbApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(LookupMealsResponse.self, from: data).meals[0]
            // TODO: Filter out null/invalid elements and safely access index 0
        } catch let error {
            print("getMeal error:", error) // TODO: Better logging
            throw TheMealDbApiError.invalidData
        }
    }
}
