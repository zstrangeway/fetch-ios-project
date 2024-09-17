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

// This is just a mocked service to simulate a Logger
struct LoggingService: LoggingServicable {
    func debug(_ message: String, stack: Error? = nil) {
        var logStatement = "=============================="
        logStatement += "\nDEBUG LOG"
        logStatement += "\nMESSAGE: \(message)"
        
        if (stack != nil) {
            logStatement += "\nSTACK:\n\(stack!)"
        }
        
        print(logStatement)
    }
    
    func error(_ message: String, stack: Error? = nil) {
        var logStatement = "=============================="
        logStatement += "\nERROR LOG"
        logStatement += "\nMESSAGE: \(message)"
        
        if (stack != nil) {
            logStatement += "\nSTACK:\n\(stack!)"
        }
        
        print(logStatement)
    }
    
    // TODO: create log funtion to clean this up
}
