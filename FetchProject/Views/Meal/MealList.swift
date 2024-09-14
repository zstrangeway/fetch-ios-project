//
//  MealList.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import SwiftUI

struct MealList: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.meals) { meal in
                    NavigationLink {
                        MealDetail(mealId: meal.id)
                    } label: {
                        MealRow(meal: meal)
                    }
                }
            }
                .animation(.default, value: modelData.meals)
                .navigationTitle("Desserts")
        } detail: {
            Text("Select a Dessert")
        }
            .task {
                do {
                    modelData.meals = try await getMeals()
                } catch let error {
                    // TODO: Properly handle error
                    print("Something went wrong: \(error)")
                }
            }
    }
    
}

#Preview {
    MealList()
        .environment(ModelData())
}
