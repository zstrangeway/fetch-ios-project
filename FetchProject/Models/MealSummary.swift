//
//  MealSummary.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import Foundation

struct MealSummary: Codable, Identifiable, Hashable {
    private var rawId: String
    private var rawName: String
    private var rawThumbUrl: String
    
    var id: String {
        return rawId
    }

    var name: String {
        return rawName
    }
    
    var thumbUrl: URL? {
        return URL(string: rawThumbUrl)
    }
    
    enum CodingKeys: String, CodingKey {
        case rawId = "idMeal"
        case rawName = "strMeal"
        case rawThumbUrl = "strMealThumb"
    }
}
