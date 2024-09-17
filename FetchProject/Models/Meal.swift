//
//  Meal.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import Foundation

struct Meal {
    let id: String
    let name: String
    let thumbUrl: URL?
    let category: String
    let area: String
    let instructions: String
    let ingredients: [Ingredient]
}

extension Meal: Equatable {
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.thumbUrl == rhs.thumbUrl &&
            lhs.category == rhs.category &&
            lhs.area == rhs.area &&
            lhs.instructions == rhs.instructions &&
            lhs.ingredients == rhs.ingredients
    }
}

extension Meal {
    struct DTO: Codable {
        let idMeal: String
        let strMeal: String
        let strMealThumb: String
        let strCategory: String
        let strArea: String
        let strInstructions: String
        
        let strIngredient1: String?
        let strIngredient2: String?
        let strIngredient3: String?
        let strIngredient4: String?
        let strIngredient5: String?
        let strIngredient6: String?
        let strIngredient7: String?
        let strIngredient8: String?
        let strIngredient9: String?
        let strIngredient10: String?
        let strIngredient11: String?
        let strIngredient12: String?
        let strIngredient13: String?
        let strIngredient14: String?
        let strIngredient15: String?
        let strIngredient16: String?
        let strIngredient17: String?
        let strIngredient18: String?
        let strIngredient19: String?
        let strIngredient20: String?
        
        let strMeasure1: String?
        let strMeasure2: String?
        let strMeasure3: String?
        let strMeasure4: String?
        let strMeasure5: String?
        let strMeasure6: String?
        let strMeasure7: String?
        let strMeasure8: String?
        let strMeasure9: String?
        let strMeasure10: String?
        let strMeasure11: String?
        let strMeasure12: String?
        let strMeasure13: String?
        let strMeasure14: String?
        let strMeasure15: String?
        let strMeasure16: String?
        let strMeasure17: String?
        let strMeasure18: String?
        let strMeasure19: String?
        let strMeasure20: String?
    }
    
    init (from dto: DTO) {
        id = dto.idMeal
        name = dto.strMeal
        thumbUrl = URL(string: dto.strMealThumb)
        category = dto.strCategory
        area = dto.strArea
        instructions = dto.strInstructions
        
        let rawIngredients = [
            (dto.strIngredient1, dto.strMeasure1),
            (dto.strIngredient2, dto.strMeasure2),
            (dto.strIngredient3, dto.strMeasure3),
            (dto.strIngredient4, dto.strMeasure4),
            (dto.strIngredient5, dto.strMeasure5),
            (dto.strIngredient6, dto.strMeasure6),
            (dto.strIngredient7, dto.strMeasure7),
            (dto.strIngredient8, dto.strMeasure8),
            (dto.strIngredient9, dto.strMeasure9),
            (dto.strIngredient10, dto.strMeasure10),
            (dto.strIngredient11, dto.strMeasure11),
            (dto.strIngredient12, dto.strMeasure12),
            (dto.strIngredient13, dto.strMeasure13),
            (dto.strIngredient14, dto.strMeasure14),
            (dto.strIngredient15, dto.strMeasure15),
            (dto.strIngredient16, dto.strMeasure16),
            (dto.strIngredient17, dto.strMeasure17),
            (dto.strIngredient18, dto.strMeasure18),
            (dto.strIngredient19, dto.strMeasure19),
            (dto.strIngredient20, dto.strMeasure20),
        ]

        // This kind of violates the principles I've been working towards.
        // This logic probably belongs somewhere else, not in an untested Model.
        
        var id = 0;
        
        ingredients = rawIngredients.filter { (name, measurement) in
            guard name != nil, name != "", measurement != nil, measurement != "" else {
                return false
            }
            return true
        }
        .map { (name, measurement) in
            id += 1
            return Ingredient(id: id, name: name ?? "", measurement: measurement ?? "")
        }
    }
}

