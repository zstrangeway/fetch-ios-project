//
//  MockMealsApiService.swift
//  FetchProjectTests
//
//  Created by Zachary Strangeway on 9/15/24.
//

import Foundation
@testable import FetchProject

enum MockMealsApiServiceError: Error {
    case mockNotSetUp
}

class MockMealsApiService: MealsApiServicable {
    var listMealsResponse: ListMealsResponse? = nil
    var lookupMealsResponse: LookupMealsResponse? = nil
    
    func listMeals() async throws -> ListMealsResponse {
        guard let strongResponse = listMealsResponse else {
            throw MockMealsApiServiceError.mockNotSetUp
        }
        
        return strongResponse
    }
    
    func getMeal(withId mealId: String) async throws -> LookupMealsResponse {
        guard let strongResponse = lookupMealsResponse else {
            throw MockMealsApiServiceError.mockNotSetUp
        }
        
        return strongResponse
    }
}
