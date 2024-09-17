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
    
    init (mealId: String, mealsApiService: MealsApiServicable, loggingService: LoggingServicable) {
        _vm = StateObject(wrappedValue: MealDetailViewModel(mealsApiService: mealsApiService, loggingService: loggingService))
        self.mealId = mealId
    }
    
    // TODO: Make a better looking loading experience, with skeletons perhaps
    var body: some View {
        ScrollView {
            if vm.isLoading {
                Text("Loading")
            } else if let meal = vm.meal {
                AsyncImage(url: meal.thumbUrl) { image in
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
                            name: meal.name,
                            category: meal.category,
                            area: meal.area
                        ),
                        alignment: .bottomLeading
                    )
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Ingredients:")
                        .font(.title2)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(meal.ingredients) { ingredient in
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
                    
                    Text(meal.instructions)
                }
                    .padding()
            } else {
                Text("Meal Not Found")
            }
        }
            .navigationTitle(vm.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await vm.loadMeal(withId: mealId)
            }
    }
}

#Preview {
    MealDetail(
        mealId: "53049",
        mealsApiService: MealsApiService(
            baseUrl: BASE_URL,
            loggingService: LoggingService(),
            urlSession: URLSession.shared
        ),
        loggingService: LoggingService()
    )
}
