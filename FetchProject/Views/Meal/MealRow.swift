//
//  MealRow.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import SwiftUI

struct MealRow: View {
    let IMAGE_SIZE: Double = 60
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
                .frame(width: IMAGE_SIZE, height: IMAGE_SIZE)
            
            Text(meal?.name ?? "")
        }
        
    }
}

#Preview {
    MealRow(meal: nil)
}
