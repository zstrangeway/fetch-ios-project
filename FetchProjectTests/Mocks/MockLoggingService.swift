//
//  MockLoggingService.swift
//  FetchProjectTests
//
//  Created by Zachary Strangeway on 9/15/24.
//

import Foundation
@testable import FetchProject

struct MockMessage {
    var message: String
    var stack: (any Error)?
}

class MockLoggingService: LoggingServicable {
    var loggedMessages: [MockMessage] = []
    
    func debug(_ message: String, stack: (any Error)?) {
        loggedMessages.append(MockMessage(message: message, stack: stack))
    }
    
    func error(_ message: String, stack: (any Error)?) {
        loggedMessages.append(MockMessage(message: message, stack: stack))
    }
}
