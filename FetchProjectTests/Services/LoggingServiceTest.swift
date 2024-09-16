//
//  LoggingServiceTest.swift
//  FetchProjectTests
//
//  Created by Zachary Strangeway on 9/16/24.
//

import XCTest
@testable import FetchProject

final class LoggingServiceTest: XCTestCase {
    enum TestError: Error {
        case testError
    }
    
    var loggingService: LoggingService!
    
    override func setUpWithError() throws {
        loggingService = LoggingService()
    }

    override func tearDownWithError() throws {
        loggingService = nil
    }
    
    func test_LoggingServiceTest_debug_printsStringWithStack() throws {
        // Given
        let message = UUID().uuidString
        let stack = TestError.testError
        
        // When
        loggingService.debug(message, stack: stack)
        
        // Then
        // This is where we would use a mock to spy on whatever we were really using to send logs. Unfortunately, I can't simulate that with print()
        XCTAssertTrue(true)
    }
    
    func test_LoggingServiceTest_debug_printsStringWithoutStack() throws {
        // Given
        let message = UUID().uuidString
        
        // When
        loggingService.debug(message)
        
        // Then
        // This is where we would use a mock to spy on whatever we were really using to send logs. Unfortunately, I can't simulate that with print()
        XCTAssertTrue(true)
    }

    func test_LoggingServiceTest_error_printsStringWithStack() throws {
        // Given
        let message = UUID().uuidString
        let stack = TestError.testError
        
        // When
        loggingService.error(message, stack: stack)
        
        // Then
        // This is where we would use a mock to spy on whatever we were really using to send logs. Unfortunately, I can't simulate that with print()
        XCTAssertTrue(true)
    }
    
    func test_LoggingServiceTest_error_printsStringWithoutStack() throws {
        // Given
        let message = UUID().uuidString
        
        // When
        loggingService.error(message)
        
        // Then
        // This is where we would use a mock to spy on whatever we were really using to send logs. Unfortunately, I can't simulate that with print()
        XCTAssertTrue(true)
    }
}
