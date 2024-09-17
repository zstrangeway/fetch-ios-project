//
//  LoggingService.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/15/24.
//

import Foundation

protocol LoggingServicable {
    func debug(_ message: String, stack: Error?)
    func error(_ message: String, stack: Error?)
}

enum LogLevel: String {
    case debug = "DEBUG"
    case error = "ERROR"
}

// This is just a mocked service to simulate a Logger
struct LoggingService: LoggingServicable {
    func debug(_ message: String, stack: Error? = nil) {
        log(message, stack: stack, level: .debug)
    }
    
    func error(_ message: String, stack: Error? = nil) {
        log(message, stack: stack, level: .error)
    }
    
    func log (_ message: String, stack: Error? = nil, level: LogLevel) {
        var logStatement = "=============================="
        logStatement += "\n\(level.rawValue) LOG"
        logStatement += "\nMESSAGE: \(message)"
        
        if (stack != nil) {
            logStatement += "\nSTACK:\n\(stack!)"
        }
        
        print(logStatement)
    }
}
