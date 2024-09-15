//
//  MealSummary.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import Foundation

struct MealSummary: Codable, Identifiable, Hashable {
    private let idMeal: String
    private let strMeal: String
    private let strMealThumb: String
    
    var id: String {
        return idMeal
    }

    var name: String {
        return strMeal
    }
    
    var thumbUrl: URL? {
        return URL(string: strMealThumb)
    }
}
