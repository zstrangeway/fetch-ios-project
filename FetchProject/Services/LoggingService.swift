//
//  LoggingService.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/15/24.
//

import Foundation

protocol LoggingServicable {
    func debug(_ message: String, stack: Error?)
}

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
}
