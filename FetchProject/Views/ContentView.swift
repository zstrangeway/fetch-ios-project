//
//  ContentView.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    private let mealsApiService: MealsApiServicable
    
    init (mealsApiService: MealsApiServicable) {
        self.mealsApiService = mealsApiService
    }
    
    var body: some View {
        MealList(mealsApiService: mealsApiService)
    }
}

#Preview {
    ContentView(mealsApiService: MealsApiService(baseUrl: "https://themealdb.com/api/json/v1/1"))
}
