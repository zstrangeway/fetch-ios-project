//
//  MealList.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import SwiftUI

struct MealList: View {
    private let mealsApiService: MealsApiServicable
    private let loggingService: LoggingServicable
    @StateObject private var vm: MealListViewModel
    
    init (mealsApiService: MealsApiServicable, loggingService: LoggingServicable) {
        _vm = StateObject(wrappedValue: MealListViewModel(mealsApiService: mealsApiService, loggingService: loggingService))
        self.mealsApiService = mealsApiService
        self.loggingService = loggingService
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(vm.meals) { meal in
                    NavigationLink {
                        MealDetail(
                            mealId: meal.id,
                            mealsApiService: mealsApiService,
                            loggingService: loggingService
                        )
                            .id(meal.id)
                    } label: {
                        MealRow(meal: meal)
                    }
                }
            }
                .animation(.default, value: vm.meals)
                .navigationTitle("Desserts")
        } detail: {
            Text("Select a Dessert")
        }
            .task {
                await vm.loadMeals()
            }
    }
    
}

#Preview {
    MealList(
        mealsApiService: MealsApiService(baseUrl: "https://themealdb.com/api/json/v1/1", loggingService: LoggingService(), urlSession: URLSession.shared),
        loggingService: LoggingService()
    )
}
