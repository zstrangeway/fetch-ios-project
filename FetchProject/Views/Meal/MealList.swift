//
//  MealList.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import SwiftUI

struct MealList: View {
    private let theMealDbApiService: TheMealDbApiServicable
    @StateObject private var vm: MealListViewModel
    
    init (theMealDbApiService: TheMealDbApiServicable) {
        _vm = StateObject(wrappedValue: MealListViewModel(theMealDbApiService: theMealDbApiService))
        self.theMealDbApiService = theMealDbApiService
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(vm.meals) { meal in
                    NavigationLink {
                        MealDetail(mealId: meal.id, theMealDbApiService: self.theMealDbApiService)
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
    MealList(theMealDbApiService: TheMealDbApiService())
}
