//
//  LookupMealsResponse.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import Foundation

import Foundation

struct LookupMealsResponse: Codable {
    private var rawMeals: [Meal]
    
    var meals: [Meal] {
        return rawMeals;
    }
    
    enum CodingKeys: String, CodingKey {
        case rawMeals = "meals"
    }
}
