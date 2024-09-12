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
                        // View
                    } label: {
                        Text(meal.name)
                    }
                }
            }
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
