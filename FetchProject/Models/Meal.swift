//
//  Meal.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import Foundation

struct Meal: Codable {
    private let idMeal: String
    private let strMeal: String
    private let strMealThumb: String
    private let strCategory: String
    private let strArea: String
    private let strInstructions: String
    
    private let strIngredient1: String
    private let strIngredient2: String
    private let strIngredient3: String
    private let strIngredient4: String
    private let strIngredient5: String
    private let strIngredient6: String
    private let strIngredient7: String
    private let strIngredient8: String
    private let strIngredient9: String
    private let strIngredient10: String
    private let strIngredient11: String
    private let strIngredient12: String
    private let strIngredient13: String
    private let strIngredient14: String
    private let strIngredient15: String
    private let strIngredient16: String
    private let strIngredient17: String
    private let strIngredient18: String
    private let strIngredient19: String
    private let strIngredient20: String
    
    private let strMeasure1: String
    private let strMeasure2: String
    private let strMeasure3: String
    private let strMeasure4: String
    private let strMeasure5: String
    private let strMeasure6: String
    private let strMeasure7: String
    private let strMeasure8: String
    private let strMeasure9: String
    private let strMeasure10: String
    private let strMeasure11: String
    private let strMeasure12: String
    private let strMeasure13: String
    private let strMeasure14: String
    private let strMeasure15: String
    private let strMeasure16: String
    private let strMeasure17: String
    private let strMeasure18: String
    private let strMeasure19: String
    private let strMeasure20: String
    
    var id: String {
        return idMeal
    }

    var name: String {
        return strMeal
    }
    
    var thumbUrl: URL? {
        return URL(string: strMealThumb)
    }
    
    var category: String {
        return strCategory
    }
    
    var area: String {
        return strArea
    }
    
    var instructions: String {
        return strInstructions
    }
    
    var ingredients: [Ingredient] {
        let rawIngredients = [
            (strIngredient1, strMeasure1),
            (strIngredient2, strMeasure2),
            (strIngredient3, strMeasure3),
            (strIngredient4, strMeasure4),
            (strIngredient5, strMeasure5),
            (strIngredient6, strMeasure6),
            (strIngredient7, strMeasure7),
            (strIngredient8, strMeasure8),
            (strIngredient9, strMeasure9),
            (strIngredient10, strMeasure10),
            (strIngredient11, strMeasure11),
            (strIngredient12, strMeasure12),
            (strIngredient13, strMeasure13),
            (strIngredient14, strMeasure14),
            (strIngredient15, strMeasure15),
            (strIngredient16, strMeasure16),
            (strIngredient17, strMeasure17),
            (strIngredient18, strMeasure18),
            (strIngredient19, strMeasure19),
            (strIngredient20, strMeasure20),
        ]
        
        var id = 0;
        
        return rawIngredients.filter { (name, measurement) in
            return !(name == "" && measurement == " ")
        }
        .map { (name, measurement) in
            id += 1
            return Ingredient(id: id, name: name, measurement: measurement)
        }
    }
}
