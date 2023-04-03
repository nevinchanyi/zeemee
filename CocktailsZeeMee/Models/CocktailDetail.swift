//
//  CocktailDetail.swift
//  CocktailsZeeMee
//
//  Created by Kostiantyn Nevinchanyi on 4/2/23.
//

import Foundation

struct DrinkDetail: Decodable {
    let drinks: [CocktailDetail]
    
    var ingredients: [String?] {
        let first = drinks.first
        return [
            first?.strIngredient1, first?.strIngredient2, first?.strIngredient3, first?.strIngredient4, first?.strIngredient5, first?.strIngredient6, first?.strIngredient7, first?.strIngredient8, first?.strIngredient9, first?.strIngredient10, first?.strIngredient11, first?.strIngredient12, first?.strIngredient13, first?.strIngredient14, first?.strIngredient15
        ]
    }
    
    var measures: [String?] {
        let first = drinks.first
        return [
            first?.strMeasure1, first?.strMeasure2, first?.strMeasure3, first?.strMeasure4, first?.strMeasure5, first?.strMeasure6, first?.strMeasure7, first?.strMeasure8, first?.strMeasure9, first?.strMeasure10, first?.strMeasure11, first?.strMeasure12, first?.strMeasure13, first?.strMeasure14, first?.strMeasure15
        ].compactMap({ $0 })
    }
}

struct CocktailDetail: Decodable {
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
    let strGlass: String?
}
