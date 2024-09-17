//
//  FetchProjectApp.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import SwiftUI

let BASE_URL = "https://themealdb.com/api/json/v1/1" // TODO: Store url in config

@main
struct FetchProjectApp: App {
    // TODO: Create IoC Container
    let urlSession = URLSession.shared
    let loggingService: LoggingService
    let mealsApiService: MealsApiService
    
    init () {
        self.loggingService = LoggingService()
        self.mealsApiService = MealsApiService(
            baseUrl: BASE_URL,
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
