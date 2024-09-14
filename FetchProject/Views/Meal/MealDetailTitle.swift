//
//  MeailDetailTitle.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import SwiftUI

struct MealDetailTitle: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text(modelData.meal?.name ?? "loading...")
                    .font(.title)
                HStack {
                    Text(modelData.meal?.category ?? "loading...")

                    Divider()
                        .frame(width: 1, height: 20)
                        .overlay(.white)

                    Text(modelData.meal?.area ?? "loading...")
                        .fontWeight(.light)
                        .italic()
                    
                    Spacer()
                }
            }
                .padding()
        }
            .foregroundColor(.white)
            .background(.black.opacity(0.5))
            
    }
}

#Preview {
    MealDetailTitle()
        .environment(ModelData())
}
