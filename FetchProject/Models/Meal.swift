//
//  Meal.swift
//  FetchProject
//
//  Created by Zachary Strangeway on 9/12/24.
//

import Foundation

struct Meal: Codable {
    internal init(idMeal: String, strMeal: String, strMealThumb: String, strCategory: String, strArea: String, strInstructions: String, strIngredient1: String, strIngredient2: String, strIngredient3: String, strIngredient4: String, strIngredient5: String, strIngredient6: String, strIngredient7: String, strIngredient8: String, strIngredient9: String, strIngredient10: String, strIngredient11: String, strIngredient12: String, strIngredient13: String, strIngredient14: String, strIngredient15: String, strIngredient16: String, strIngredient17: String, strIngredient18: String, strIngredient19: String, strIngredient20: String, strMeasure1: String, strMeasure2: String, strMeasure3: String, strMeasure4: String, strMeasure5: String, strMeasure6: String, strMeasure7: String, strMeasure8: String, strMeasure9: String, strMeasure10: String, strMeasure11: String, strMeasure12: String, strMeasure13: String, strMeasure14: String, strMeasure15: String, strMeasure16: String, strMeasure17: String, strMeasure18: String, strMeasure19: String, strMeasure20: String) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
        self.strCategory = strCategory
        self.strArea = strArea
        self.strInstructions = strInstructions
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strIngredient8 = strIngredient8
        self.strIngredient9 = strIngredient9
        self.strIngredient10 = strIngredient10
        self.strIngredient11 = strIngredient11
        self.strIngredient12 = strIngredient12
        self.strIngredient13 = strIngredient13
        self.strIngredient14 = strIngredient14
        self.strIngredient15 = strIngredient15
        self.strIngredient16 = strIngredient16
        self.strIngredient17 = strIngredient17
        self.strIngredient18 = strIngredient18
        self.strIngredient19 = strIngredient19
        self.strIngredient20 = strIngredient20
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
        self.strMeasure8 = strMeasure8
        self.strMeasure9 = strMeasure9
        self.strMeasure10 = strMeasure10
        self.strMeasure11 = strMeasure11
        self.strMeasure12 = strMeasure12
        self.strMeasure13 = strMeasure13
        self.strMeasure14 = strMeasure14
        self.strMeasure15 = strMeasure15
        self.strMeasure16 = strMeasure16
        self.strMeasure17 = strMeasure17
        self.strMeasure18 = strMeasure18
        self.strMeasure19 = strMeasure19
        self.strMeasure20 = strMeasure20
    }
    
    private var idMeal: String
    private var strMeal: String
    private var strMealThumb: String
    private var strCategory: String
    private var strArea: String
    private var strInstructions: String
    
    private var strIngredient1: String
    private var strIngredient2: String
    private var strIngredient3: String
    private var strIngredient4: String
    private var strIngredient5: String
    private var strIngredient6: String
    private var strIngredient7: String
    private var strIngredient8: String
    private var strIngredient9: String
    private var strIngredient10: String
    private var strIngredient11: String
    private var strIngredient12: String
    private var strIngredient13: String
    private var strIngredient14: String
    private var strIngredient15: String
    private var strIngredient16: String
    private var strIngredient17: String
    private var strIngredient18: String
    private var strIngredient19: String
    private var strIngredient20: String
    
    private var strMeasure1: String
    private var strMeasure2: String
    private var strMeasure3: String
    private var strMeasure4: String
    private var strMeasure5: String
    private var strMeasure6: String
    private var strMeasure7: String
    private var strMeasure8: String
    private var strMeasure9: String
    private var strMeasure10: String
    private var strMeasure11: String
    private var strMeasure12: String
    private var strMeasure13: String
    private var strMeasure14: String
    private var strMeasure15: String
    private var strMeasure16: String
    private var strMeasure17: String
    private var strMeasure18: String
    private var strMeasure19: String
    private var strMeasure20: String
    
    
    
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
