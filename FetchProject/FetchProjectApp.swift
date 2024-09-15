//
//  FetchProjectApp.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import SwiftUI

@main
struct FetchProjectApp: App {
    // Only one dependency, but would consider an IoC container in the future
    let theMealDbApiService = TheMealDbApiService()
    
    var body: some Scene {
        WindowGroup {
            ContentView(theMealDbApiService: theMealDbApiService)
        }
    }
}
