//
//  MealSummary.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/11/24.
//

import Foundation

struct MealSummary: Identifiable, Hashable {
    let id: String
    let name: String
    let thumbUrl: URL?
}
