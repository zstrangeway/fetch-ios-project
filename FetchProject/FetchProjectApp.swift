//
//  FetchProjectApp.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import SwiftUI

@main
struct FetchProjectApp: App {
    // Only two dependencies, but would consider an IoC container in the future to keep things manageable
    // TODO: Store url in config
    let urlSession = URLSession.shared
    let loggingService: LoggingService
    let mealsApiService: MealsApiService
    
    
    init () {
        let loggingService = LoggingService()
        
        self.loggingService = loggingService
        self.mealsApiService = MealsApiService(
            baseUrl: "https://themealdb.com/api/json/v1/1",
            loggingService: loggingService,
            urlSession: urlSession
        )
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(
                mealsApiService: mealsApiService,
                loggingService: loggingService
            )
        }
    }
}
