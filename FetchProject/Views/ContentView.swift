//
//  ContentView.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    private let theMealDbApiService: TheMealDbApiServicable
    
    init (theMealDbApiService: TheMealDbApiServicable) {
        self.theMealDbApiService = theMealDbApiService
    }
    
    var body: some View {
        MealList(theMealDbApiService: self.theMealDbApiService)
    }
}

#Preview {
    ContentView(theMealDbApiService: TheMealDbApiService())
}
