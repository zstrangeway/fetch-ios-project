//
//  ContentView.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MealList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
