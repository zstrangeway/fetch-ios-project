//
//  File.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import Foundation

struct ListMealsResponseDTO: Codable {
    let meals: [MealSummaryDTO?]
}
