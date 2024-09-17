//
//  MealsApiServiceTests.swift
//  FetchProjectTests
//
//  Created by Zachary Strangeway on 9/16/24.
//

import XCTest
@testable import FetchProject

struct InvalidResponse: Codable {
    let foo: String
}

class MealsApiServiceTests: XCTestCase {
    let encoder = JSONEncoder()
    var mealsApiService: MealsApiService!
    var mockLoggingService: MockLoggingService!
    var mockURLSession: MockURLSession!
    
    override func setUpWithError() throws {
        mockLoggingService = MockLoggingService()
        mockURLSession = MockURLSession()
        mealsApiService = MealsApiService(
            baseUrl: "https://mock.api",
            loggingService: mockLoggingService,
            urlSession: mockURLSession
        )
    }

    override func tearDownWithError() throws {
        mealsApiService = nil
        mockLoggingService = nil
        mockURLSession = nil
    }

    func test_MealsApiService_listMeals_succeeds() async throws {
        // Given
        let listMealsResponseDTO = MockMealData.generateListMealsResponseDTO(2)
        let mockData = try encoder.encode(listMealsResponseDTO)
        mockURLSession.data = mockData
        mockURLSession.response = HTTPURLResponse(
            url: URL(string: "https://mock.api")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        // When
        let response = try await mealsApiService.listMeals()
        
        // Then
        XCTAssertEqual(ListMealsResponse(from: listMealsResponseDTO), response)
    }
    
    func test_MealsApiService_listMeals_throwsInvalidUrl() async {
        // Given
        let mealsApiService_invalidUrl = MealsApiService(baseUrl: "%_invalid_url_%", loggingService: mockLoggingService, urlSession: mockURLSession)
        
        // When
        do {
            let _ = try await mealsApiService_invalidUrl.listMeals()
            XCTFail() // fail on success
        } catch let error {
            // Then
            XCTAssertEqual(error as? MealsApiError, MealsApiError.invalidUrl)
        }
    }
    
    func test_MealsApiService_listMeals_throwsInvalidResponse() async throws {
        // Given
        mockURLSession.response = HTTPURLResponse(
            url: URL(string: "https://mock.api")!,
            statusCode: 500,
            httpVersion: nil,
            headerFields: nil
        )
        
        // When
        do {
            let _ = try await mealsApiService.listMeals()
            XCTFail() // fail on success
        } catch let error {
            // Then
            XCTAssertEqual(error as? MealsApiError, MealsApiError.invalidResponse)
        }
    }
    
    func test_MealsApiService_listMeals_throwsInvalidData() async throws {
        // Given
        let invalidResponse = InvalidResponse(foo: "bar")
        let invalidData = try encoder.encode(invalidResponse)
        mockURLSession.data = invalidData
        mockURLSession.response = HTTPURLResponse(
            url: URL(string: "https://mock.api")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        // When
        do {
            let _ = try await mealsApiService.listMeals()
            XCTFail() // fail on success
        } catch let error {
            // Then
            XCTAssertEqual(error as? MealsApiError, MealsApiError.invalidData)
        }
    }
    
    func test_MealsApiService_getMeal_succeeds() async throws {
        // Given
        let lookupMealsResponseDTO = MockMealData.generateLookupMealsResponseDTO()
        let mockData = try encoder.encode(lookupMealsResponseDTO)
        mockURLSession.data = mockData
        mockURLSession.response = HTTPURLResponse(
            url: URL(string: "https://mock.api")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        // When
        let response = try await mealsApiService.getMeal(withId: UUID().uuidString)
        
        // Then
        XCTAssertEqual(LookupMealsResponse(from: lookupMealsResponseDTO), response)
    }
    
    func test_MealsApiService_getMeal_throwsInvalidUrl() async {
        // Given
        let mealsApiService_invalidUrl = MealsApiService(baseUrl: "%_invalid_url_%", loggingService: mockLoggingService, urlSession: mockURLSession)
        
        // When
        do {
            let _ = try await mealsApiService_invalidUrl.getMeal(withId: UUID().uuidString)
            XCTFail() // fail on success
        } catch let error {
            // Then
            XCTAssertEqual(error as? MealsApiError, MealsApiError.invalidUrl)
        }
    }
    
    func test_MealsApiService_getMeal_throwsInvalidResponse() async throws {
        // Given
        mockURLSession.response = HTTPURLResponse(
            url: URL(string: "https://mock.api")!,
            statusCode: 500,
            httpVersion: nil,
            headerFields: nil
        )
        
        // When
        do {
            let _ = try await mealsApiService.getMeal(withId: UUID().uuidString)
            XCTFail() // fail on success
        } catch let error {
            // Then
            XCTAssertEqual(error as? MealsApiError, MealsApiError.invalidResponse)
        }
    }
    
    func test_MealsApiService_getMeal_throwsInvalidData() async throws {
        // Given
        let invalidResponse = InvalidResponse(foo: "bar")
        let invalidData = try encoder.encode(invalidResponse)
        mockURLSession.data = invalidData
        mockURLSession.response = HTTPURLResponse(
            url: URL(string: "https://mock.api")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        // When
        do {
            let _ = try await mealsApiService.getMeal(withId: UUID().uuidString)
            XCTFail() // fail on success
        } catch let error {
            // Then
            XCTAssertEqual(error as? MealsApiError, MealsApiError.invalidData)
        }
    }
}
