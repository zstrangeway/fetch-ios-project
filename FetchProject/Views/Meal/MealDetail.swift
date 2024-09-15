//
//  MealDetail.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import SwiftUI

struct MealDetail: View {
    var mealId: String
    
    @StateObject private var vm: MealDetailViewModel
    
    init (mealId: String, theMealDbApiService: TheMealDbApiServicable) {
        _vm = StateObject(wrappedValue: MealDetailViewModel(theMealDbApiService: theMealDbApiService))
        self.mealId = mealId
    }
    
    var body: some View {
        ScrollView {
            Text("Hello World")
            AsyncImage(url: vm.meal?.thumbUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
            }
                .frame(height: 300)
                .clipped()
                .overlay(
                    MealDetailTitle(
                        name: vm.meal?.name ?? "loading...",
                        category: vm.meal?.category ?? "loading...",
                        area: vm.meal?.area ?? "loading..."
                    ),
                    alignment: .bottomLeading
                )
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Ingredients:")
                    .font(.title2)
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(vm.meal?.ingredients ?? []) { ingredient in
                        HStack {
                            Text(ingredient.measurement)
                            Text(ingredient.name)
                                .fontWeight(.bold)
                            Spacer()
                        }
                    }
                }
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Text("Instructions:")
                    .font(.title2)
                
                Text(vm.meal?.instructions ?? "loading...")
            }
                .padding()
        }
            .navigationTitle(vm.meal?.name ?? "loading...")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await vm.loadMeal(withId: self.mealId)
            }
    }
}

#Preview {
    MealDetail(mealId: "53049", theMealDbApiService: TheMealDbApiService())
}
