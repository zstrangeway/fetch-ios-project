//
//  MealRow.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import SwiftUI

struct MealRow: View {
    let imageSize: Double = 60
    
    var meal: MealSummary?
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: meal?.thumbUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
                .frame(width: imageSize, height: imageSize)
            
            Text(meal?.name ?? "Dessert")
        }
        
    }
}

#Preview {
    MealRow(meal: nil)
        .environment(ModelData())
}
