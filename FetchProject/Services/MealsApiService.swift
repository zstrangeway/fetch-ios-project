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
    case mealNotFound
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
            let responseDTO = try decoder.decode(ListMealsResponseDTO.self, from: data)
            return try transformListMealsResponseDTO(responseDTO)
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
            let responseDTO = try decoder.decode(LookupMealsResponseDTO.self, from: data)
            return try tranformLookupMealsResponseDTO(responseDTO)
        } catch let error {
            loggingService.error("unable to decode data into LookupMealsResponse: \(data)", stack: error)
            throw MealsApiError.invalidData
        }
    }
    
    private func transformListMealsResponseDTO(_ dto: ListMealsResponseDTO) throws -> [MealSummary] {
        guard let mealSummaryDTOs: [MealSummaryDTO] = dto.meals.filter({ $0 != nil }) as? [MealSummaryDTO] else {
            throw MealsApiError.invalidData
        }
        
        return mealSummaryDTOs.map{MealSummary(
            id: $0.idMeal,
            name: $0.strMeal,
            thumbUrl: URL(string: $0.strMealThumb)
        )}
    }
    
    private func tranformLookupMealsResponseDTO(_ dto: LookupMealsResponseDTO) throws -> Meal {
        guard dto.meals.count > 0 else {
            // This should never happen... an invalid id should return a 404 response and trigger an earlier exception
            throw MealsApiError.mealNotFound
        }
        
        let mealDTO = dto.meals[0]
        
        var ingredients: [Ingredient] {
            let rawIngredients = [
                (mealDTO.strIngredient1, mealDTO.strMeasure1),
                (mealDTO.strIngredient2, mealDTO.strMeasure2),
                (mealDTO.strIngredient3, mealDTO.strMeasure3),
                (mealDTO.strIngredient4, mealDTO.strMeasure4),
                (mealDTO.strIngredient5, mealDTO.strMeasure5),
                (mealDTO.strIngredient6, mealDTO.strMeasure6),
                (mealDTO.strIngredient7, mealDTO.strMeasure7),
                (mealDTO.strIngredient8, mealDTO.strMeasure8),
                (mealDTO.strIngredient9, mealDTO.strMeasure9),
                (mealDTO.strIngredient10, mealDTO.strMeasure10),
                (mealDTO.strIngredient11, mealDTO.strMeasure11),
                (mealDTO.strIngredient12, mealDTO.strMeasure12),
                (mealDTO.strIngredient13, mealDTO.strMeasure13),
                (mealDTO.strIngredient14, mealDTO.strMeasure14),
                (mealDTO.strIngredient15, mealDTO.strMeasure15),
                (mealDTO.strIngredient16, mealDTO.strMeasure16),
                (mealDTO.strIngredient17, mealDTO.strMeasure17),
                (mealDTO.strIngredient18, mealDTO.strMeasure18),
                (mealDTO.strIngredient19, mealDTO.strMeasure19),
                (mealDTO.strIngredient20, mealDTO.strMeasure20),
            ]
            
            var id = 0;
            
            return rawIngredients.filter { (name, measurement) in
                guard name != nil, name != "", measurement != nil, measurement != "" else {
                    return false
                }
                return true
            }
            .map { (name, measurement) in
                id += 1
                return Ingredient(id: id, name: name ?? "", measurement: measurement ?? "")
            }
        }
        
        return Meal(
            id: mealDTO.idMeal,
            name: mealDTO.strMeal,
            thumbUrl: URL(string: mealDTO.strMealThumb),
            category: mealDTO.strCategory,
            area: mealDTO.strArea,
            instructions: mealDTO.strInstructions,
            ingredients: ingredients
        )
    }
}
