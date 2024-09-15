//
//  FetchProjectApp.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import SwiftUI

@main
struct FetchProjectApp: App {
    // Only two dependencies, but would consider an IoC container in the future
    let mealsApiService = MealsApiService(baseUrl: "https://themealdb.com/api/json/v1/1") // TODO: Store url in config
    
    var body: some Scene {
        WindowGroup {
            ContentView(mealsApiService: mealsApiService)
        }
    }
}
