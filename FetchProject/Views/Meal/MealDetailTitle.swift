//
//  MeailDetailTitle.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import SwiftUI

struct MealDetailTitle: View {
    let name: String
    let category: String
    let area: String
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text(name)
                    .font(.title)
                HStack {
                    Text(category)

                    Divider()
                        .frame(width: 1, height: 20)
                        .overlay(.white)

                    Text(area)
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
    MealDetailTitle(name: "Name", category: "Category", area: "Area")
}
