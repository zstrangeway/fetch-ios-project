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
    func listMeals() async throws -> ListMealsResponse
    func getMeal(withId mealId: String) async throws -> LookupMealsResponse
}

protocol DecodableFromDTO {
    associatedtype DTO: Codable
    init(from dto: DTO) throws
}

class MealsApiService: MealsApiServicable {
    let loggingService: LoggingServicable
    let baseUrl: String
    let urlSession: URLSessionProtocol
    
    init(baseUrl: String, loggingService: LoggingServicable, urlSession: URLSessionProtocol) {
        self.baseUrl = baseUrl
        self.loggingService = loggingService
        self.urlSession = urlSession
    }
    
    func listMeals() async throws -> ListMealsResponse {
        let endpoint = "\(baseUrl)/filter.php?c=Dessert"
        return try await getAndDecodeData(from: endpoint)
    }
    
    func getMeal(withId mealId: String) async throws -> LookupMealsResponse {
        let endpoint = "\(baseUrl)/lookup.php?i=\(mealId)";
        return try await getAndDecodeData(from: endpoint)
    }
    
    // TODO: Potentially move to HTTP Service once the is an IoC Container
    func getAndDecodeData<T: DecodableFromDTO>(from endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint, encodingInvalidCharacters: false) else {
            loggingService.error("Unable to parse endpoint string into URL: \(endpoint)", stack: nil)
            throw MealsApiError.invalidUrl
        }
        
        let (data, response) = try await urlSession.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            loggingService.error("Invalid Response: \(response)", stack: nil)
            throw MealsApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let responseDTO = try decoder.decode(T.DTO.self, from: data)
            return try T(from: responseDTO)
        } catch let error {
            loggingService.error("unable to decode data into LookupMealsResponse: \(data)", stack: error)
            throw MealsApiError.invalidData
        }
    }
}
