//
//  MealList.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import SwiftUI

struct MealList: View {
    private let mealsApiService: MealsApiServicable
    @StateObject private var vm: MealListViewModel
    
    init (mealsApiService: MealsApiServicable) {
        _vm = StateObject(wrappedValue: MealListViewModel(mealsApiService: mealsApiService))
        self.mealsApiService = mealsApiService
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(vm.meals) { meal in
                    NavigationLink {
                        MealDetail(mealId: meal.id, mealsApiService: mealsApiService)
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
    MealList(mealsApiService: MealsApiService(baseUrl: "https://themealdb.com/api/json/v1/1"))
}
