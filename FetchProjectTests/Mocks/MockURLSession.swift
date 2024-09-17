//
//  File.swift
//  FetchProjectTests
//
//  Created by Zachary Strangeway on 9/16/24.
//

import Foundation
@testable import FetchProject

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        return (data ?? Data(), response ?? URLResponse())
    }
}
