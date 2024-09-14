//
//  MealDetail.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import SwiftUI

struct MealDetail: View {
    @Environment(ModelData.self) var modelData
    
    var mealId: String
    
    var body: some View {
        ScrollView {
            AsyncImage(url: modelData.meal?.thumbUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
            }
                .frame(height: 300)
                .clipped()
                .overlay(MealDetailTitle(), alignment: .bottomLeading)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Ingredients:")
                    .font(.title2)
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(modelData.meal?.ingredients ?? []) { ingredient in
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
                
                Text(modelData.meal?.instructions ?? "loading...")
            }
                .padding()
        }
            .navigationTitle(modelData.meal?.name ?? "loading...")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                do {
                    modelData.meal = try await getMeal(with: mealId)
                } catch let error {
                    // TODO: Properly handle error
                    print("Something went wrong: \(error)")
                }
            }
    }
}

#Preview {
    MealDetail(mealId: "53049")
        .environment(ModelData())
}
