//
//  ContentView.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    private let mealsApiService: MealsApiServicable
    private let loggingService: LoggingServicable
    
    init (mealsApiService: MealsApiServicable, loggingService: LoggingServicable) {
        self.mealsApiService = mealsApiService
        self.loggingService = loggingService
    }
    
    var body: some View {
        MealList(mealsApiService: mealsApiService, loggingService: loggingService)
    }
}

#Preview {
    ContentView(
        mealsApiService: MealsApiService(baseUrl: "https://themealdb.com/api/json/v1/1"),
        loggingService: LoggingService()
    )
}
