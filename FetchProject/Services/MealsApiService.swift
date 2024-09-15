//
//  TheMealDbApiService.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/14/24.
//

import Foundation

enum MealsApiError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}

protocol MealsApiServicable {
    func listMeals() async throws -> [MealSummary]
    func getMeal(withId mealId: String) async throws -> Meal
}

class MealsApiService: MealsApiServicable {
    let loggingService: LoggingServicable
    let baseUrl: String
    
    init(baseUrl: String, loggingService: LoggingServicable) {
        self.baseUrl = baseUrl
        self.loggingService = loggingService
    }
    
    func listMeals() async throws -> [MealSummary] {
        let endpoint = "\(baseUrl)/filter.php?c=Dessert"
        
        guard let url = URL(string: endpoint) else {
            loggingService.error("Unable to parse endpoint string into URL: \(endpoint)", stack: nil)
            throw MealsApiError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            loggingService.error("Invalid Response: \(response)", stack: nil)
            throw MealsApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ListMealsResponse.self, from: data).meals
            // TODO: Filter out null/invalid elements
        } catch let error {
            loggingService.error("unable to decode data into ListMealsResponse: \(data)", stack: error)
            throw MealsApiError.invalidData
        }
    }
    
    func getMeal(withId mealId: String) async throws -> Meal {
        let endpoint = "\(baseUrl)/lookup.php?i=\(mealId)";
        
        guard let url = URL(string: endpoint) else {
            loggingService.error("Unable to parse endpoint string into URL: \(endpoint)", stack: nil)
            throw MealsApiError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            loggingService.error("Invalid Response: \(response)", stack: nil)
            throw MealsApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(LookupMealsResponse.self, from: data).meals[0]
            // TODO: Filter out null/invalid elements and safely access index 0
        } catch let error {
            loggingService.error("unable to decode data into LookupMealsResponse: \(data)", stack: error)
            throw MealsApiError.invalidData
        }
    }
}
